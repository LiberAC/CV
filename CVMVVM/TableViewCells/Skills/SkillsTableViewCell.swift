//
//  SkillsTableViewCell.swift
//  CV
//
//  Created by Liber Alfonso on 5/10/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import UIKit

class SkillsTableViewCell: UITableViewCell, CellConfigurable {

    //MARK:  - Attributes
    @IBOutlet private weak var lblSkillName: UILabel?
    @IBOutlet private weak var lblYears: UILabel?
    @IBOutlet private weak var imgLogo: UIImageView?

    //MARK: - CellConfigurable
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? SkillsCellViewModel else {
            return
        }
        lblSkillName?.text = viewModel.skillName
        lblYears?.text = viewModel.skillYears
        
        viewModel.isImageDataReady.addObserver { [weak self] (data) in
            DispatchQueue.main.async {
                self?.imgLogo?.image = UIImage.init(data: data)
            }
        }
    }
    
}
