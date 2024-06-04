//
//  DetailsScreenRouter.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//


import UIKit

protocol DetailsScreenRoutingLogic {
}

protocol DetailsScreenDataPassing {
    var dataStore: DetailsScreenDataStore? { get }
}

class DetailsScreenRouter {
    weak var viewController: DetailsScreenViewController?
    var dataStore: DetailsScreenDataStore?
    init(viewController: DetailsScreenViewController) {
        self.viewController = viewController
    }
}
// MARK: Extensions
extension DetailsScreenRouter: DetailsScreenRoutingLogic {
}
extension DetailsScreenRouter: DetailsScreenDataPassing {
}
