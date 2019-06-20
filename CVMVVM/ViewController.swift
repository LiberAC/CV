//
//  ViewController.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var titleLabel: UILabel!
    private var loadingIndicatorView: UIActivityIndicatorView!


    private var listController = CVListController()
    
    private lazy var dataSource: CVDataSource = {
        return CVDataSource()
    }()
    
    private var viewModel: CVListViewModel {
        return listController.viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createIndicatorView()
        setupBinding()
        listController.start()
    }
    
    private func createIndicatorView() {
        loadingIndicatorView = UIActivityIndicatorView.init(style: .gray)
        loadingIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loadingIndicatorView);

        let horizontalConstraint = loadingIndicatorView
            .centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let verticalConstraint = loadingIndicatorView
            .centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        
    }
    
    func setupBinding() {
        viewModel.sectionViewModels.addObserver(fireNow: false) { [weak self] (sectionViewModels) in
            self?.dataSource.currentCVViewModel = self?.viewModel
            self?.tableView.dataSource = self?.dataSource
            self?.tableView.reloadData()
        }
        
        viewModel.title.addObserver { [weak self] (title) in
            self?.titleLabel.text = title
        }
        
        viewModel.isTableViewHidden.addObserver { [weak self] (isHidden) in
            self?.tableView.isHidden = isHidden
        }
        
        viewModel.isLoading.addObserver { [weak self] (isLoading) in
            if isLoading {
                self?.loadingIndicatorView.startAnimating()
            } else {
                self?.loadingIndicatorView.stopAnimating()
            }
        }
    }
}

