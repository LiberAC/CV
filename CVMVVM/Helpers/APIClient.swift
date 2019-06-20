//
//  APIClient.swift
//  CV
//
//  Created by Liber Alfonso on 5/9/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation

let baseURL = "https://gist.githubusercontent.com/LiberAC/c48d1f23d1602735cc78ca2095cdcc31/raw/3d44b234de9f788ca5cfff77fd7cfea535068b1d/cv.json"

class APIClient {
    
    static func getCVData(completion:@escaping (Result<CVData, Error>)->Void) {
        if let url = URL(string: baseURL) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    completion(.failure(error))
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    let error = NSError(domain: "Client error", code: 0, userInfo: nil)
                    completion(.failure(error))
                    return
                }
                
                do {
                    if let data = data {
                        let cvData = try JSONDecoder().decode(CVData.self, from: data)
                        completion(.success(cvData))
                    }else{
                        let error = NSError(domain: "Server error", code: 0, userInfo: nil)
                        completion(.failure(error))
                    }
 
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        } else {
            let error = NSError(domain: "Malformed URL", code: 0, userInfo: nil)
            completion(.failure(error))
        }
        
    }
    
}
