//
//  ListingScreenRouter.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//


import UIKit

protocol ListingScreenRoutingLogic {
    func routeToDetails()
}

protocol ListingScreenDataPassing {
    var dataStore: ListingScreenDataStore? { get }
}

class ListingScreenRouter {
    weak var viewController: ListingScreenViewController?
    var dataStore: ListingScreenDataStore?
    init(viewController: ListingScreenViewController) {
        self.viewController = viewController
    }
}
// MARK: Extensions
extension ListingScreenRouter: ListingScreenRoutingLogic {
    func routeToDetails() {
        guard let model = dataStore?.selectedModel else { return }
        guard let viewController = viewController else { return }
        let vc =  configurator.detailsViewController(model: model, delgate: viewController)
        vc.modalPresentationStyle = .fullScreen
        self.viewController?.present(vc, animated: true)
    }
    
}
extension ListingScreenRouter: ListingScreenDataPassing {
}
