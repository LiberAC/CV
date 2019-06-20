//
//  CellConfigurable.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation

protocol RowViewModel {
    func getCellIdentifier() -> String
}

protocol CellConfigurable {
    func setup(viewModel: RowViewModel)
}
