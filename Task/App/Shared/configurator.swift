//
//  configurator.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//

import UIKit

struct configurator {
    static func listingViewController() -> UIViewController {
        let view = ListingScreenViewController()
        let presenter = ListingScreenPresenter(view: view)
        let interactor = ListingScreenInteractor(presenter: presenter)
        let router = ListingScreenRouter(viewController: view)
        view.router = router
        view.interactor = interactor
        router.dataStore = interactor
        return view
    }
    static func detailsViewController(model: ListingScreen.Model, delgate: refreshDelgate) -> UIViewController {
        let view = DetailsScreenViewController(model: model, delgate: delgate)
        let presenter = DetailsScreenPresenter(view: view)
        let interactor = DetailsScreenInteractor(presenter: presenter)
        let router = DetailsScreenRouter(viewController: view)
        view.router = router
        view.interactor = interactor
        router.dataStore = interactor
        return view
    }
}
