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
        
    init(skill : Skills) {
        self.skillName = skill.skillName
        self.skillYears = skill.experienceYears
        self.imgLogoURL = skill.skillLogo
    }
    
    func getCellIdentifier() -> String {
        return "SkillsTableViewCell"
    }

}
