//
//  CVListController.swift
//  CVMVVM
//
//  Created by Liber Alfonso on 5/13/19.
//  Copyright © 2019 LAC. All rights reserved.
//

import Foundation


/// Localized names for the different sections
enum SectionsName: String {
    case summary = "Summary_section_title"
    case jobs = "Experience_section_title"
    case skills = "Skills_section_title"
    
    /**
     Returns the localized names for the sections
     
     - Returns: The localize string name
     */
    func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

class CVListController {
    let viewModel: CVListViewModel
    
    init(viewModel: CVListViewModel = CVListViewModel()) {
        self.viewModel = viewModel
    }
    
    /**
     Initialize the values and calls the APIClient to retrieve the CVData
     */
    func start() {
        self.viewModel.isLoading.value = true
        self.viewModel.isTableViewHidden.value = true
        self.viewModel.title.value = NSLocalizedString("Loading_legend", comment: "")
        
        let apiClient = APIClient()
        apiClient.getCVData(completion:  { [weak self]  result in
            switch result {
            case .success(let cvData):
                self?.viewModel.title.value = NSLocalizedString("My_CV_legend", comment: "")
                self?.viewModel.isLoading.value = false
                self?.viewModel.isTableViewHidden.value = false
                self?.createViewModels(cv: cvData)
            case .failure(let error):
                self?.viewModel.title.value = error.localizedDescription
                self?.viewModel.isLoading.value = false
            }
        })
    }
    
    /**
     Create the view models
     
     - Parameters:
        - cv: A CVData object that contains the data to create the models.
     */
    func createViewModels(cv: CVData) {
        let summaryRowViewModel = SummaryCellViewModel.init(summary: cv.summary)
        let summarySectionViewModel = SectionViewModel.init(rowViewModels: [summaryRowViewModel], headerTitle: SectionsName.summary.localizedString())
        
        let jobsVM = cv.jobs.map({ (job) -> RowViewModel in
            return JobsCellViewModel.init(job: job)
        })
        let jobsSectionViewModel = SectionViewModel.init(rowViewModels: jobsVM, headerTitle: SectionsName.jobs.localizedString())
        
        let skillsVM = cv.skills.map({ (skill) -> RowViewModel in
            return SkillsCellViewModel.init(skill: skill)
        })
        
        let skillsSectionViewModel = SectionViewModel.init(rowViewModels: skillsVM, headerTitle: SectionsName.skills.localizedString())
        
        self.viewModel.sectionViewModels.value = [summarySectionViewModel, jobsSectionViewModel, skillsSectionViewModel]
    }

}
