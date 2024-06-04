//
//  ListingScreenModels.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//



import UIKit

enum ListingScreen {
    // MARK: Use cases
    struct Model: Codable {
            let domains: [String]?
            let stateProvince: String?
            let name: String?
            let webPages: [String]?
            let country: String?
            let alphaTwoCode: String?

            enum CodingKeys: String, CodingKey {
                case domains
                case stateProvince = "state-province"
                case name
                case webPages = "web_pages"
                case country
                case alphaTwoCode = "alpha_two_code"
            }
    }
    struct viewModel {
        let universityName: String
        let universityState: String
        init(model: Model ) {
            self.universityName = model.name ?? ""
            self.universityState = model.stateProvince ?? ""
        }
    }
    
    }
