//
//  ViewController.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:  - Attributes
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var titleLabel: UILabel!
    private var loadingIndicatorView: UIActivityIndicatorView!


    private var listController = CVListController()
    
    private var dataSource : CVDataSource?
    
    private var viewModel: CVListViewModel {
        return listController.viewModel
    }
    
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        createIndicatorView()
        setupBinding()
        listController.start()
    }
    
    //MARK: -
    
    /// Instanciate and setup the constrainst for the loading indicator
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
    
    /// Add the bindings for the UI elements
    func setupBinding() {
        viewModel.sectionViewModels.addObserver(fireNow: false) { [weak self] (sectionViewModels) in
            guard let viewModel = self?.viewModel else{
                return
            }
            self?.dataSource = CVDataSource.init(viewModel: viewModel)
            DispatchQueue.main.async {
                self?.tableView.dataSource = self?.dataSource
                self?.tableView.reloadData()
            }
        }
        
        viewModel.title.addObserver { [weak self] (title) in
            DispatchQueue.main.async {
                self?.titleLabel.text = title
            }
        }
        
        viewModel.isTableViewHidden.addObserver { [weak self] (isHidden) in
            DispatchQueue.main.async {
                self?.tableView.isHidden = isHidden
            }
        }
        
        viewModel.isLoading.addObserver { [weak self] (isLoading) in
            DispatchQueue.main.async {
                if isLoading {
                    self?.loadingIndicatorView.startAnimating()
                
                } else {
                    self?.loadingIndicatorView.stopAnimating()
                }
            }
        }
    }
}

