//
//  DetailsScreenInteractor.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//


import UIKit

protocol DetailsScreenBusinessLogic {
}

protocol DetailsScreenDataStore {
}

class DetailsScreenInteractor {
    // MARK: Variabels
    var presenter: DetailsScreenPresentationLogic?
    init(presenter: DetailsScreenPresentationLogic?) {
        self.presenter = presenter
    }
    // MARK: Functions
}
// MARK: Extensions
extension DetailsScreenInteractor: DetailsScreenBusinessLogic {
}

extension DetailsScreenInteractor: DetailsScreenDataStore {
}
