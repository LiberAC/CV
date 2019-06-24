//
//  APIClientTest.swift
//  CVMVVMTests
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import XCTest

class APIClientTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCVData() {
        
        let expectation = self.expectation(description: "consulting")
        
        var aCVData: CVData?
        var anError : Error?
        let apiClient = APIClient()
        apiClient.getCVData( completion: { result in
            expectation.fulfill()
            switch result {
            case .success(let cvData):
                aCVData = cvData
            case .failure(let error):
                anError = error
            }
        })
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(anError)
        XCTAssertNotNil(aCVData)
    }
}
