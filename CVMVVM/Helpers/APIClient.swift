//
//  APIClient.swift
//  CV
//
//  Created by Liber Alfonso on 5/9/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation

/// An API to manage the calls to web services
class APIClient {
    
    /**
     Call the webservice to retrieve the cv data.
     
     - Parameters:
        - completion: A Result Object, either with the CVData in the success case or an Error with the localized cause.
     */
    
    static func getCVData(completion:@escaping (Result<CVData, Error>)->Void) {
        if let url = URL(string: baseURL) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    completion(.failure(error))
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    completion(.failure(NetworkError.clientError))
                    return
                }
                
                do {
                    if let data = data {
                        let cvData = try JSONDecoder().decode(CVData.self, from: data)
                        completion(.success(cvData))
                    }else{
                        completion(.failure(NetworkError.serverError))
                    }
 
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        } else {
            completion(.failure(NetworkError.malformedURL))
        }
    }
    
    /**
     Call the webservice to retrieve an image data.
     
     - Parameters:
        - completion: A Result Object, either with the image Data in the success case or an Error with the localized cause.
        - url: an URL for the external asset
     */
    
    static func getImageDataFromExternalURL(url: URL, completion:@escaping (Result<Data, Error>)->Void) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                completion(.failure(NetworkError.clientError))
            }
            
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NetworkError.serverError))

            }
            
            
        }).resume()
    }
    
}
