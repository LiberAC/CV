//
//  JobsTableViewCell.swift
//  CV
//
//  Created by Liber Alfonso on 5/10/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import UIKit

class JobsTableViewCell: UITableViewCell, CellConfigurable {
 
    //MARK:  - Attributes
    @IBOutlet private weak var lblCompanyName: UILabel?
    @IBOutlet private weak var lblRole: UILabel?
    @IBOutlet private weak var lblSummary: UILabel?
    @IBOutlet private weak var imgLogo: UIImageView?
    

    //MARK: - CellConfigurable
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? JobsCellViewModel else {
            return
        }
        lblSummary?.text = viewModel.summary
        lblRole?.text = viewModel.role
        lblCompanyName?.text = viewModel.companyName
        
        viewModel.isImageDataReady.addObserver { [weak self] (data) in
            DispatchQueue.main.async {
                self?.imgLogo?.image = UIImage.init(data: data)
            }
        }
    }
    
}
