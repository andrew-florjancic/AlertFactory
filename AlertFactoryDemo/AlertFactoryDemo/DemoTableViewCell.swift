//
//  DemoTableViewCell.swift
//  AlertFactoryDemo
//
//  Created by Andrew Florjancic on 8/6/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import UIKit

/// Cell for displaying different Alerts
class DemoTableViewCell: UITableViewCell {
    static let identifier = "DemoTableViewCell"
    
    /// Alert to be displayed
    var alert: UIAlertController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    /// Configures the cell with a provided view model
    /// - Parameter viewModel: A model used to configure the cell data
    func configure(with viewModel: DemoTableViewCellModel) {
        textLabel?.text = viewModel.title
        accessibilityIdentifier = viewModel.alert.view.accessibilityIdentifier
        alert = viewModel.alert
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// A view model used to configre a tableView cell with a title and alert
struct DemoTableViewCellModel {
    let title: String
    let alert: UIAlertController
}
