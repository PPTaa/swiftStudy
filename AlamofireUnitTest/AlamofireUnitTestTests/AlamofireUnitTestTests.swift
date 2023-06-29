//
//  AlamofireUnitTestTests.swift
//  AlamofireUnitTestTests
//
//  Created by leejungchul on 2023/02/21.
//

import XCTest
@testable import Alamofire
@testable import AlamofireUnitTest

final class AlamofireUnitTestTests: XCTestCase {

    private var vc: ApiTest!
    
    override func setUp() {
        super.setUp()
        
        let session: Session = {
            let configuration: URLSessionConfiguration = {
                let configuration = URLSessionConfiguration.default
                configuration.protocolClasses = [MockURLProtocol.self]
                return configuration
            }()
            
            return Session(configuration: configuration)
        }()
        vc = ApiTest(session: session)
    }
    
    override func tearDown() {
        super.tearDown()
        vc = nil
    }
    
    func testStatusCode200ReturnsStatusCode200() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 200)

        let expectation = XCTestExpectation(description: "Performs a request")

        // when
        
        vc.getRecommendStoreList() { (bool, data)  in
            debugPrint(bool, data)
            XCTAssertEqual(bool, false)
            expectation.fulfill()
        }

        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
