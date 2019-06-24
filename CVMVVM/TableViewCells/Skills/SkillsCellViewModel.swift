//
//  SkillsCellViewModel.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation

class SkillsCellViewModel : RowViewModel {
    
    let skillName: String
    let skillYears: String
    var imgLogoURL: URL
    let isImageDataReady = Watcher<Data>(value: Data())

        
    init(skill : Skills) {
        self.skillName = skill.skillName
        self.skillYears = skill.experienceYears
        self.imgLogoURL = skill.skillLogo
        self.getUIImageData()
    }
    
    //MARK: RowViewModel
    func getCellIdentifier() -> String {
        return TableViewCellID.skills.rawValue
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
