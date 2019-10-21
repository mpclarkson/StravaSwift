//
//  SwiftyJSONRequest.swift
//  StravaSwift
//
//  Created by Matthew on 15/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//MARK: - Methods

extension DataRequest {

    @discardableResult
    func responseStrava<T: Strava>(_ completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return responseStrava(nil, keyPath: nil, completionHandler: completionHandler)
    }

    @discardableResult
    func responseStrava<T: Strava>(_ keyPath: String, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return responseStrava(nil, keyPath: keyPath, completionHandler: completionHandler)
    }

    @discardableResult
    func responseStrava<T: Strava>(_ queue: DispatchQueue?, keyPath: String?, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: DataRequest.StravaSerializer(keyPath), completionHandler: completionHandler)
    }

    @discardableResult
    func responseStravaArray<T: Strava>(_ completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self {
        return responseStravaArray(nil, keyPath: nil, completionHandler: completionHandler)
    }

    @discardableResult
    func responseStravaArray<T: Strava>(_ keyPath: String, completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self {
        return responseStravaArray(nil, keyPath: keyPath, completionHandler: completionHandler)
    }

    @discardableResult
    func responseStravaArray<T: Strava>(_ queue: DispatchQueue?, completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self {
        return responseStravaArray(queue, keyPath: nil, completionHandler: completionHandler)
    }

    @discardableResult
    func responseStravaArray<T: Strava>(_ queue: DispatchQueue?, keyPath: String?, completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: DataRequest.StravaArraySerializer(keyPath), completionHandler: completionHandler)
    }
}

//MARK: Serializers

//TODO: Clean these up so there is no duplication

extension DataRequest {

    typealias SerializeResponse = (URLRequest?, HTTPURLResponse?, Data?, Error?)

    fileprivate static func parseResponse(_ info: SerializeResponse) -> (Result<Any>?, Error?) {
        let (request, response, data, error) = info

        guard let _ = data else {
            let error = generateError(failureReason: "Data could not be serialized. Input data was nil.", response: response)
            return (nil, error)
        }

        let JSONResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
        let result = JSONResponseSerializer.serializeResponse(request, response, data, error)

        return (result, nil)
    }

    fileprivate static func generateError(failureReason: String, response: HTTPURLResponse?) -> NSError {
        let errorDomain = "com.stravaswift.error"
        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
        let code = response?.statusCode ?? 0
        let returnError = NSError(domain: errorDomain, code: code, userInfo: userInfo)

        return returnError
    }

    static func StravaSerializer<T: Strava>(_ keyPath: String?) -> DataResponseSerializer<T> {
        return DataResponseSerializer { request, response, data, error in
            let (result, e) = parseResponse((request, response, data, error))

            if let e = e {
                return .failure(e)
            }

            if let json = result?.value {
                let object = T.init(JSON(json))
                return .success(object)
            }

            return .failure(generateError(failureReason: "StravaSerializer failed to serialize response.", response: response))
        }
    }

    static func StravaArraySerializer<T: Strava>(_ keyPath: String?) -> DataResponseSerializer<[T]> {
        return DataResponseSerializer { request, response, data, error in

            let (result, e) = parseResponse((request, response, data, error))

            if let e = e {
                return .failure(e)
            }

            if let json = result?.value {
                var results: [T] = []
                JSON(json).array?.forEach {
                    results.append(T.init($0))
                }

                return .success(results)
            }

            return .failure(generateError(failureReason: "StravaSerializer failed to serialize response.", response: response))
        }
    }
}
