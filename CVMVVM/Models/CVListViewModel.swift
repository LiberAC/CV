//
//  CVListViewModel.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation

class CVListViewModel {
    let title = Watcher<String>(value: NSLocalizedString("Loading_legend", comment: ""))
    let isLoading = Watcher<Bool>(value: false)
    let isTableViewHidden = Watcher<Bool>(value: false)
    let sectionViewModels = Watcher<[SectionViewModel]>(value: [])
}
