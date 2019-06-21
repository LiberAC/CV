//
//  CustomError.swift
//  CVMVVM
//
//  Created by Liber Alfonso Castillo on 6/20/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation



/// Custom network defined error , inherits from Error class
enum NetworkError: Error {
    case clientError
    case serverError
    case malformedURL
}



extension NetworkError: LocalizedError {
    
    /**
     Provides the description for the custom network error.
     
     - Returns: An string with the localized erro cause
     */
    public var errorDescription: String? {
        switch self {
        case .clientError:
            return NSLocalizedString("Client_error", comment: "")
        case .serverError:
            return NSLocalizedString("Server_error", comment: "")
        case .malformedURL:
            return NSLocalizedString("Malformed_url", comment: "")
        }
    }
}
