//
//  ListingScreenPresenter.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//


import UIKit

protocol ListingScreenPresentationLogic {
    func reloadData()
    func showloader()
    func hideLoader()
}
class ListingScreenPresenter {
    weak var viewController: ListingScreenDisplayLogic?
    init(view: ListingScreenDisplayLogic) {
        self.viewController = view
    }
}
// MARK: Extensions
extension ListingScreenPresenter: ListingScreenPresentationLogic {
    func showloader() {
        viewController?.startLoading()
    }
    
    func hideLoader() {
        viewController?.stopLoading()
    }
    
    func reloadData() {
        viewController?.reloadData()
    }
    
}
