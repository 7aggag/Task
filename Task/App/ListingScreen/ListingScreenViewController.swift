//
//  ListingScreenViewController.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//


import UIKit
// MARK: Protocol
protocol ListingScreenDisplayLogic: LoaderViewProtocol {
    func reloadData()
}

class ListingScreenViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "ListingTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "ListingTableViewCell")
        }
    }
    // MARK: Variabels
    var interactor: ListingScreenBusinessLogic?
    var router: (  ListingScreenRoutingLogic & ListingScreenDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ListingScreen"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.viewDidLoad()
    }
    
}

extension ListingScreenViewController: ListingScreenDisplayLogic {
    func reloadData() {
        DispatchQueue.main.async {
            self.stopLoading()
            self.tableView.reloadData()
        }
    }
}
extension ListingScreenViewController: refreshDelgate {
    func refresh() {
        interactor?.viewDidLoad()
    }
    
    
}
extension ListingScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.modelsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListingTableViewCell", for: indexPath) as? ListingTableViewCell else { return UITableViewCell()}
        interactor?.configureCell(cell: cell, index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.didSelectRow(index: indexPath.row)
        router?.routeToDetails()
    }
    
}
