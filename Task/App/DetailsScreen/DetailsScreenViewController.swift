//
//  DetailsScreenViewController.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//



import UIKit

// MARK: Protocol
protocol refreshDelgate {
    func refresh()
}

protocol DetailsScreenDisplayLogic: AnyObject {
}

class DetailsScreenViewController: UIViewController {
    // MARK: @IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var webLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    // MARK: Variabels
    var interactor: DetailsScreenBusinessLogic?
    var router: (  DetailsScreenRoutingLogic & DetailsScreenDataPassing)?
    var model: ListingScreen.Model
    var delgate: refreshDelgate
    // MARK: View life cycle
    init(model: ListingScreen.Model, delgate: refreshDelgate ) {
        self.model = model
        self.delgate = delgate
        super.init(nibName: nil, bundle: nil)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayData()
    }
    // MARK: Functions
    // MARK: @IBActions
    private func displayData() {
        nameLabel.text = model.name
        stateLabel.text = model.stateProvince
        countryLabel.text = model.country
        countryCodeLabel.text = model.alphaTwoCode
        webLabel.text = model.webPages?.first
    }
    private func addShadow() {
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = false
    }
    @IBAction private func refreshAction(_ sender: UIButton) {
        self.dismiss(animated: true)
        delgate.refresh()
    }
}

extension DetailsScreenViewController: DetailsScreenDisplayLogic {
}
