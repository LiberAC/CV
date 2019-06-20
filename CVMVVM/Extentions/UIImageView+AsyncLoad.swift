//
//  UIImageView+AsyncLoad.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 6/19/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import UIKit

extension UIImageView {
    
    public func imageFromExternalURL(url: URL) {
        self.image = nil
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                return
            }
        
            if let data = data {
                DispatchQueue.main.async(execute: { () -> Void in
                    self.image = UIImage(data: data)
                })
            }

            
        }).resume()
    }
}
