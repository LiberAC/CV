//
//  SkillsTableViewCell.swift
//  CV
//
//  Created by Liber Alfonso on 5/10/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import UIKit

class SkillsTableViewCell: UITableViewCell, CellConfigurable {

    @IBOutlet private weak var lblSkillName: UILabel?
    @IBOutlet private weak var lblYears: UILabel?
    @IBOutlet private weak var imgLogo: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: CellConfigurable
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? SkillsCellViewModel else {
            return
        }
        lblSkillName?.text = viewModel.skillName
        lblYears?.text = viewModel.skillYears
        imgLogo?.imageFromExternalURL(url: viewModel.imgLogoURL)
    }
    
}
