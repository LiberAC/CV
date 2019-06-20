//
//  DataSourceTest.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import XCTest
@testable import CVMVVM


class DataSourceTests: XCTestCase {
    
    var dataSource : CVDataSource!
    
    override func setUp() {
        super.setUp()
        dataSource = CVDataSource()
        dataSource.currentCVViewModel = CVListViewModel()
    }
    
    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }
    
    func testEmptyValueInDataSource() {
        
        // giving empty data value
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected zero section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 0, "Expected zero section in table view")
        
    }
    
    func testValueInDataSource() {
        
        let summaryRowViewModelA = SummaryCellViewModel.init(summary: "a")
        let summaryRowViewModelB = SummaryCellViewModel.init(summary: "b")
        let summarySectionViewModel = SectionViewModel.init(rowViewModels: [summaryRowViewModelA, summaryRowViewModelB], headerTitle: SectionsName.summary.rawValue)

        dataSource.currentCVViewModel.sectionViewModels.value  = [summarySectionViewModel]

        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected two cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected two cell in table view")
    }
    
    func testValueCell() {
        
        let summaryRowViewModelA = SummaryCellViewModel.init(summary: "a")
        let summarySectionViewModel = SectionViewModel.init(rowViewModels: [summaryRowViewModelA], headerTitle: SectionsName.summary.rawValue)
        
        dataSource.currentCVViewModel.sectionViewModels.value  = [summarySectionViewModel]

        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(SummaryTableViewCell.self, forCellReuseIdentifier: "SummaryTableViewCell")
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        // expected SummaryTableViewCell class
        guard let _ = dataSource.tableView(tableView, cellForRowAt: indexPath) as? SummaryTableViewCell else {
            XCTAssert(false, "Expected SummaryTableViewCell class")
            return
        }
    }
}
