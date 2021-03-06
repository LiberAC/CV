//
//  SummaryTableViewCell.swift
//  CV
//
//  Created by Liber Alfonso on 5/10/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import UIKit

class SummaryTableViewCell: UITableViewCell, CellConfigurable {
    
    //MARK:  - Attributes
    @IBOutlet private weak var lblSummary: UILabel?
    
    //MARK: - CellConfigurable
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? SummaryCellViewModel else {
            return
        }
        lblSummary?.text = viewModel.summary
    }
    
}
