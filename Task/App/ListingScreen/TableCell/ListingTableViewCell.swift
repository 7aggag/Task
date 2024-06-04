//
//  ListingTableViewCell.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//


import UIKit
protocol ListingTableViewCellProtocol {
    func configureCell(viewModel: ListingScreen.viewModel )
}

class ListingTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ListingTableViewCell: ListingTableViewCellProtocol {
    func configureCell(viewModel: ListingScreen.viewModel) {
        titleLabel.text = viewModel.universityName
        descriptionLabel.text = viewModel.universityState
    }
    
    
}
