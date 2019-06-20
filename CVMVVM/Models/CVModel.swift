//
//  CVModel.swift
//  CV
//
//  Created by Liber Alfonso on 5/9/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation

struct CVData: Decodable {
    let summary : String
    let jobs : Array<Jobs>
    let skills : Array<Skills>
}

struct Jobs: Decodable {
    let company : String
    let role : String
    let description : String
    let companyLogo : URL
}

struct Skills: Decodable {
    let skillName : String
    let experienceYears : String
    let skillLogo : URL
}


