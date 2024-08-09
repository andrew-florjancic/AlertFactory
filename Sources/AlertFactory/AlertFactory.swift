//
//  AlertFactory.swift
//  AlertFactory
//
//  Created by Andrew Florjancic on 8/6/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import UIKit

/// A user defined action used to build `UIAlertAction`s
public protocol Action {
    /// A model used to create `UIAlertAction`s
    var model: ActionModel { get }
}

extension Action {
    /// Creates a `UIAlertAction` configured with the provided data
    /// - Parameter handler: A block of code to execute when the user selects this action
    /// - Returns: A `UIAlertAction` ready to be added to a `UIAlertController`
    public func create(handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
        let action = UIAlertAction(title: model.title, style: model.style, handler: handler)
        action.isEnabled = model.isEnabled
        return action
    }
}

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
    public func create(actions: [UIAlertAction],
                       preferredAction: UIAlertAction? = nil,
                       textFieldHandlers: [((UITextField) -> Void)?] = []) -> UIAlertController {
        let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: model.preferredStyle)
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


/// A model containing information used to create `UIAlertAction`s
public struct ActionModel {
    public let title: String
    public let style: UIAlertAction.Style
    public let isEnabled: Bool
    
    /// Creates and returns an `ActionModel` used to create `UIAlertAction`s
    /// - Parameters:
    ///   - title: The title of the action.
    ///   - style: The style of action, default is default.
    ///   - isEnabled: A boolean indicating if the action is able to be interacted with, default is true.
    public init(title: String,
                style: UIAlertAction.Style = .default,
                isEnabled: Bool = true) {
        self.title = title
        self.style = style
        self.isEnabled = isEnabled
    }
}
