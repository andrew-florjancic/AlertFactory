//
//  AlertFactoryDemoVC.swift
//  AlertFactoryDemo
//
//  Created by Andrew Florjancic on 8/6/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import UIKit

/// ViewController to demonstrate different alerts
class AlertFactoryDemoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// The `UITableView` connected to the storyboard
    @IBOutlet weak var tableView: UITableView!
    
    /// The view model for this view controller
    let viewModel = AlertFactoryDemoVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DemoTableViewCell.self, forCellReuseIdentifier: DemoTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? DemoTableViewCell, let alert = cell.alert else { return }
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DemoTableViewCell.identifier,
                                                       for: indexPath) as? DemoTableViewCell,
              let model = viewModel.getCellModel(for: indexPath) else { return UITableViewCell() }
        cell.configure(with: model)
        return cell
    }
}


/// A view model for the AlertFactoryDemoVC
struct AlertFactoryDemoVM {

    /// An array of cell models to configure each cell with
    let cellModels: [DemoTableViewCellModel] = []
    
    /// Gets the cell model  for the provided given indexPath
    /// - Parameter indexPath: The `IndexPath` of the desired cell
    /// - returns: The cell model for the provided `IndexPath`, or `nil` if the model does not exist
    func getCellModel(for indexPath: IndexPath) -> DemoTableViewCellModel? {
       cellModels.indices.contains(indexPath.row) ? cellModels[indexPath.row] : nil
    }
}
