//
//  CVModel.swift
//  CV
//
//  Created by Liber Alfonso on 5/9/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation

/// Main struct that holds the values for the cv data
struct CVData: Decodable {
    let summary : String
    let jobs : Array<Jobs>
    let skills : Array<Skills>
}

/// Struct that holds the values for a Job
struct Jobs: Decodable {
    let company : String
    let role : String
    let description : String
    let companyLogo : URL
}

/// Struct that holds the values for a Skill
struct Skills: Decodable {
    let skillName : String
    let experienceYears : String
    let skillLogo : URL
}


