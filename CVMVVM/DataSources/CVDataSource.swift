//
//  CVDataSource.swift
//  CV
//
//  Created by Liber Alfonso on 5/10/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import UIKit


class CVDataSource: NSObject, UITableViewDataSource {
    
    private var currentCVViewModel : CVListViewModel
    
    init(viewModel: CVListViewModel) {
        self.currentCVViewModel = viewModel
    }

    //MARK: Table view Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return currentCVViewModel.sectionViewModels.value.count
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        let sectionViewModel = currentCVViewModel.sectionViewModels.value[section]
        return sectionViewModel.headerTitle
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        let sectionViewModel = currentCVViewModel.sectionViewModels.value[section]
        return sectionViewModel.rowViewModels.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionViewModel = currentCVViewModel.sectionViewModels.value[indexPath.section]
        let rowViewModel = sectionViewModel.rowViewModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: rowViewModel.getCellIdentifier(), for: indexPath)
        
        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }
        
        return cell
    }
}

