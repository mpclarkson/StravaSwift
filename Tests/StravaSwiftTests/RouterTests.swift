import XCTest
@testable import StravaSwift

final class RouterTests: XCTestCase {

    let baseApiUrl = "https://www.strava.com/api/v3"

    func testAthleteRequest() {
        let urlRequest = try! Router.athlete.asURLRequest()
        XCTAssertEqual(urlRequest.url?.absoluteString, "\(baseApiUrl)/athlete")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertNil(urlRequest.httpBody)
    }

    static var allTests = [
        ("testAthleteRequest", testAthleteRequest),
    ]
}
