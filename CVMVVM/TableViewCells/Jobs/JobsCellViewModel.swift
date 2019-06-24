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
    let isImageDataReady = Watcher<Data>(value: Data())

    
    init(job : Jobs) {
        self.summary = job.description
        self.role = job.role
        self.companyName = job.company
        self.imgLogoURL = job.companyLogo
        self.getUIImageData()
    }
    
    //MARK: RowViewModel
    func getCellIdentifier() -> String {
        return TableViewCellID.jobs.rawValue
    }
    
    func getUIImageData() {
        let apiClient = APIClient()
        apiClient.getImageDataFromExternalURL(url: imgLogoURL, completion:  { [weak self]  result in
            switch result {
            case .success(let data):
                self?.isImageDataReady.value = data
            case .failure( _):
                //fail silently
                break
            }
        })
    }
}
