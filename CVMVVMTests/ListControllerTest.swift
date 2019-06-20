//
//  ListControllerTest.swift
//  CVMVVMTests
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import XCTest

class ListControllerTest: XCTestCase {

    let listController : CVListController = CVListController()
    var data: CVData? = nil
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let anURL = URL(string: "https://as2.ftcdn.net/jpg/01/47/82/43/500_F_147824394_y6VTXKqUOjWarhztDqx0UmqOo45ARn5F.jpg")
        let job = Jobs(company: "company",
                       role: "role",
                       description: "description",
                       companyLogo:anURL!)
        let skill = Skills(skillName: "name", experienceYears: "1", skillLogo: anURL!)
        self.data = CVData(summary: "summary", jobs: [job], skills: [skill])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.data = nil
    }

    func testHarCodedModelGeneration() {
        listController.createViewModels(cv: data!)
        
        XCTAssertEqual(listController.viewModel.sectionViewModels.value.count, 3, "Expected 3 models")
        
        let summary = listController.viewModel.sectionViewModels.value.first
        XCTAssertEqual(summary?.rowViewModels.count, 1, "Expected 1 model")
        
        guard let _ = summary?.rowViewModels.first as? SummaryCellViewModel else {
            XCTAssert(false, "Expected SummaryCellViewModel class")
            return
        }
            
    }
    
    func testModelGenerationfromWS(){
        
        let expectation = self.expectation(description: "consulting")

        var aCVData: CVData?
        var anError : Error?
        
        APIClient.getCVData( completion: { result in
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
        
        listController.createViewModels(cv: aCVData!)

        XCTAssertEqual(listController.viewModel.sectionViewModels.value.count, 3, "Expected 3 models")
        let jobs = listController.viewModel.sectionViewModels.value[1]
        XCTAssertEqual(jobs.rowViewModels.count, 2, "Expected 2 model")
        
    }
}

