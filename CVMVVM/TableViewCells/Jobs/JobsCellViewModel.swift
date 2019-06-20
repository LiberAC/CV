//
//  JobsCellViewModel.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation

class JobsCellViewModel : RowViewModel {
    
    let summary: String
    let role: String
    let companyName: String
    var imgLogoURL: URL
    
    init(job : Jobs) {
        self.summary = job.description
        self.role = job.role
        self.companyName = job.company
        self.imgLogoURL = job.companyLogo
    }
    
    func getCellIdentifier() -> String {
        return "JobsTableViewCell"
    }
}
