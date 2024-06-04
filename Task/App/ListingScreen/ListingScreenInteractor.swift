//
//  ListingScreenInteractor.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//

import UIKit

protocol ListingScreenBusinessLogic {
    func viewDidLoad()
    var modelsCount: Int? { get }
    func configureCell(cell: ListingTableViewCellProtocol, index: Int)
    func didSelectRow(index: Int)
}

protocol ListingScreenDataStore {
    var selectedModel : ListingScreen.Model? { get }
}

class ListingScreenInteractor {
    // MARK: Variabels
    var presenter: ListingScreenPresentationLogic?
    var models: [ListingScreen.Model] = []
    var modelsCount: Int?
    var selectedModel: ListingScreen.Model?
    init(presenter: ListingScreenPresentationLogic?) {
        self.presenter = presenter
    }
    // MARK: Functions
   private func fetchDataRequst() {
       self.presenter?.showloader()
        guard let url = URL(string: "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates") else {
            print("Invalid URL")
            return
        }
        NetworkManager.shared.fetchData(from: url, responseType: [ListingScreen.Model].self) { [weak self] result in
            guard let self else { return  }
            switch result {
            case .success(let data):
                print("Fetched Data: \(data)")
                self.models = data
                self.modelsCount = data.count
                self.presenter?.reloadData()
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
// MARK: Extensions
extension ListingScreenInteractor: ListingScreenBusinessLogic {
    func didSelectRow(index: Int) {
        if index < models.count {
            let model = models[index]
            selectedModel = model
        }
    }
    func configureCell(cell: ListingTableViewCellProtocol, index: Int) {
        let model = models[index]
        let viewModel: ListingScreen.viewModel = .init(model: model)
        cell.configureCell(viewModel: viewModel)
    }
    
    func viewDidLoad() {
        fetchDataRequst()
    }
    
}

extension ListingScreenInteractor: ListingScreenDataStore {
    
}
