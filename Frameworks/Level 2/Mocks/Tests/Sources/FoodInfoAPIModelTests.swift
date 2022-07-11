import XCTest
@testable import Mocks
@testable import API

class FoodInfoAPIModelTests: XCTestCase {

    func testCorrectResponseParsing() throws {
        let result = FoodInfoAPIModel.loadMock(correct: true)

        XCTAssertNotNil(result)
        XCTAssertEqual(result?.meta.code, 200)
        XCTAssertNotNil(result?.response)
        XCTAssertNil(result?.meta.errorDetail)
        XCTAssertNil(result?.meta.errorType)
    }

    func testIncorrectResponseParsing() throws {
        let result = FoodInfoAPIModel.loadMock(correct: false)

        XCTAssertNotNil(result)
        XCTAssertEqual(result?.meta.code, 404)
        XCTAssertNil(result?.response)
        XCTAssertNotNil(result?.meta.errorDetail)
        XCTAssertNotNil(result?.meta.errorType)
    }

}
