//
//  DetailsScreenPresenter.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//


import UIKit

protocol DetailsScreenPresentationLogic {
}
class DetailsScreenPresenter {
    weak var viewController: DetailsScreenDisplayLogic?
    init(view: DetailsScreenDisplayLogic) {
        self.viewController = view
    }
}
// MARK: Extensions
extension DetailsScreenPresenter: DetailsScreenPresentationLogic {
}
