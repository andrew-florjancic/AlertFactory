//
//  Alert.swift
//  AlertFactory
//
//  Created by Andrew Florjancic on 8/6/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import UIKit

/// A user defined alert used to build `UIAlertController`s
public protocol Alert {
    /// A model used to create `UIAlertController`s
    var model: AlertModel { get }
}

extension Alert {
    /// Creates a `UIAlertController` configured with the provided data
    /// - Parameters:
    ///   - actions: An array of `UIAlertAction`s to be added to the alert being created
    ///   - preferredAction: The preferred action will be highlighted, only used for alerts and will be ignored by action sheets
    ///   - textFieldHandlers: An array of blocks of code to interact with `UITextField`s attached to the alert
    /// - Returns: A `UIAlertController` ready to be presented
    public func create(actions: [UIAlertAction] = [],
                       preferredAction: UIAlertAction? = nil,
                       textFieldHandlers: [((UITextField) -> Void)?] = []) -> UIAlertController {
        let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: model.preferredStyle)
        alert.view.accessibilityIdentifier = String(describing: self)
        alert.isSpringLoaded = model.isSpringLoaded
        alert.severity = model.severity
        textFieldHandlers.forEach { handler in
            alert.addTextField(configurationHandler: handler)
        }
        actions.forEach { action in
            alert.addAction(action)
        }
        alert.preferredAction = preferredAction
        return alert
    }
}

/// A model containing information used to create `UIAlertController`s
public struct AlertModel {
    public let title: String
    public let message: String?
    public let preferredStyle: UIAlertController.Style
    public let severity: UIAlertControllerSeverity
    public let isSpringLoaded: Bool
    
    /// Creates and returns an `AlertModel` used to create `UIAlertController`s
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - message: An optional message displayed below the title, default is nil.
    ///   - preferredStyle: The preferred style of alert, default is alert.
    ///   - severity: The severity of the alert, default is default.
    ///   - isSpringLoaded: A boolean indicating if the alert is participating in sprint-loaded interaction, default is true.
    public init(title: String,
                message: String? = nil,
                preferredStyle: UIAlertController.Style = .alert,
                severity: UIAlertControllerSeverity = .default,
                isSpringLoaded: Bool = true) {
        self.title = title
        self.message = message
        self.preferredStyle = preferredStyle
        self.severity = severity
        self.isSpringLoaded = isSpringLoaded
    }
}
