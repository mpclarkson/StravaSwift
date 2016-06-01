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

extension Request {
    
    func responseStrava<T: Strava>(completionHandler: Response<T, NSError> -> Void) -> Self {
        return responseStrava(nil, keyPath: nil, completionHandler: completionHandler)
    }
    
    func responseStrava<T: Strava>(keyPath: String, completionHandler: Response<T, NSError> -> Void) -> Self {
        return responseStrava(nil, keyPath: keyPath, completionHandler: completionHandler)
    }
    
    func responseStrava<T: Strava>(queue: dispatch_queue_t?, keyPath: String?, completionHandler: Response<T, NSError> -> Void) -> Self {
        return response(queue: queue, responseSerializer: Request.StravaSerializer(keyPath), completionHandler: completionHandler)
    }
    
    func responseStravaArray<T: Strava>(completionHandler: Response<[T], NSError> -> Void) -> Self {
        return responseStravaArray(nil, keyPath: nil, completionHandler: completionHandler)
    }
    
    func responseStravaArray<T: Strava>(keyPath: String, completionHandler: Response<[T], NSError> -> Void) -> Self {
        return responseStravaArray(nil, keyPath: keyPath, completionHandler: completionHandler)
    }
    
    func responseStravaArray<T: Strava>(queue: dispatch_queue_t?, completionHandler: Response<[T], NSError> -> Void) -> Self {
        return responseStravaArray(queue, keyPath: nil, completionHandler: completionHandler)
    }
    
    func responseStravaArray<T: Strava>(queue: dispatch_queue_t?, keyPath: String?, completionHandler: Response<[T], NSError> -> Void) -> Self {
        return response(queue: queue, responseSerializer: Request.StravaArraySerializer(keyPath), completionHandler: completionHandler)
    }
}

//MARK: Serializers

//TODO: Clean these up so there is no duplication

extension Request {
    
    typealias SerializeResponse = (NSURLRequest?, NSHTTPURLResponse?, NSData?, NSError?)
    
    private static func parseResponse(info: SerializeResponse) -> (Result<AnyObject,NSError>?, NSError?) {
        let (request, response, data, error) = info
        
        guard let _ = data else {
            let error = generateError("Data could not be serialized. Input data was nil.")
            return (nil, error)
        }
        
        let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
        let result = JSONResponseSerializer.serializeResponse(request, response, data, error)
        
        return (result, nil)
    }
    
    private static func generateError(string: String) -> NSError {
        return Error.errorWithCode(.DataSerializationFailed, failureReason: string)
    }
    
    static func StravaSerializer<T: Strava>(keyPath: String?) -> ResponseSerializer<T, NSError> {
        return ResponseSerializer { request, response, data, error in
            let (result, e) = parseResponse(request, response, data, error)
            
            if let e = e {
                return .Failure(e)
            }
            
            if let json = result?.value {
                let object = T.init(JSON(json))
                return .Success(object)
            }

            return .Failure(generateError("StravaSerializer failed to serialize response."))
        }
    }
    
    static func StravaArraySerializer<T: Strava>(keyPath: String?) -> ResponseSerializer<[T], NSError> {
        return ResponseSerializer { request, response, data, error in
            
            let (result, e) = parseResponse(request, response, data, error)
            
            if let e = e {
                return .Failure(e)
            }
            
            if let json = result?.value {
                var results:[T] = []
                JSON(json).array?.forEach {
                    results.append(T.init($0))
                }
                
                return .Success(results)
            }

            return .Failure(generateError("StravaSerializer failed to serialize response."))
        }
    }
}
