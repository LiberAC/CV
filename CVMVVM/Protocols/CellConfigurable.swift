//
//  CellConfigurable.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation

/// Protocol to be adopted by the UITableViewCells
@objc protocol RowViewModel {
    func getCellIdentifier() -> String
    @objc optional func getUIImageData()
}

/// Protocol to setup the configuration for UITableViewCells
protocol CellConfigurable {
    func setup(viewModel: RowViewModel)
}
