//
//  SummaryCellViewModel.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation

class SummaryCellViewModel : RowViewModel {
    
    let summary: String
    
    init(summary : String) {
        self.summary = summary
    }
    
    func getCellIdentifier() -> String {
        return "SummaryTableViewCell"
    }

}
