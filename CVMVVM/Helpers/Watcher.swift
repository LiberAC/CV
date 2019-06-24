//
//  Watcher.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation

/// An Observer for the UI elements
class Watcher<T> {
    
    private var valueChanged: ((T) -> Void)?
    
    init(value: T) {
        self.value = value
    }
    
    var value: T {
        didSet {
            self.valueChanged?(self.value)
        }
    }
    
    func addObserver(fireNow: Bool = true,
                     _ onChange: ((T) -> Void)?) {
        valueChanged = onChange
        if fireNow {
            onChange?(value)
        }
    }
}
