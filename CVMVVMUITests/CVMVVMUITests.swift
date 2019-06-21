//
//  CVMVVMUITests.swift
//  CVMVVMUITests
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import XCTest

class CVMVVMUITests: XCTestCase {
    
    var app: XCUIApplication!

    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
    }
    
    func testRowNumber() {
        app.launch()
        _ = app.waitForExistence(timeout: 5)
        let table = app.tables
        XCTAssertTrue(table.count == 1)
        XCTAssertEqual(table.cells.count, 6, "There should be 6 rows")
    }
    
    func testStatusLabel() {
        app.launch()
        _ = app.waitForExistence(timeout: 5)
        let statusLabel = app.staticTexts["My CV"]
        XCTAssertEqual(statusLabel.exists, true)
    }
    
    func testImages() {
        app.launch()
        _ = app.waitForExistence(timeout: 5)
        let table = app.tables
        let images = table.images
        XCTAssertEqual(images.count, 2, "There should be 2 images")
    }
    
    
    func testSections() {
        app.launch()
        _ = app.waitForExistence(timeout: 5)
        let table = app.tables
        let sectionSkill = table.otherElements["Skills"]
        XCTAssertEqual(sectionSkill.exists, true)
        
        let sectionSummary = table.otherElements["Summary"]
        XCTAssertEqual(sectionSummary.exists, true)
        
        app.swipeUp()
        
        let sectionJobs = table.otherElements["Experience"]
        XCTAssertEqual(sectionJobs.exists, true)
    }
    
    

}

