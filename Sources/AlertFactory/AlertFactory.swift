//
//  AlertFactory.swift
//  AlertFactory
//
//  Created by Andrew Florjancic on 8/6/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import UIKit


/// Creates a new UIAlertController from the provided model.
/// - Parameter model: An AlertModel containing information to populate the UIAlertController being created.
/// - Returns: A UIAlertController configured with the model settings.
public func createAlert(model: AlertModel) -> UIAlertController {
    let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: model.preferredStyle)
    alert.severity = model.severity
    model.actions.forEach { alert.addAction($0) }
    alert.preferredAction = model.preferredAction
    model.textFieldConfigurationHandlers.forEach { alert.addTextField(configurationHandler: $0) }
    alert.isSpringLoaded = model.isSpringLoaded
    return alert
    }


/// A model containing information used to create a UIAlertController
public struct AlertModel {
    let title: String?
    let message: String?
    let preferredStyle: UIAlertController.Style
    let severity: UIAlertControllerSeverity
    let actions: [UIAlertAction]
    let preferredAction: UIAlertAction?
    let textFieldConfigurationHandlers: [((UITextField) -> Void)?]
    let isSpringLoaded: Bool
    
    public init(title: String? = nil,
                message: String? = nil,
                preferredStyle: UIAlertController.Style = .alert,
                severity: UIAlertControllerSeverity = .default,
                actionModels: [AlertActionModel] = [],
                preferredActionIndex: Int? = nil,
                textFieldConfigurationHandlers: [((UITextField) -> Void)?] = [],
                isSpringLoaded: Bool = true) {
        self.title = title
        self.message = message
        self.preferredStyle = preferredStyle
        self.severity = severity
        actions = actionModels.map {
            let action = UIAlertAction(title: $0.title, style: $0.style, handler: $0.handler)
            action.isEnabled = $0.isEnabled
            return action
        }
        if let index = preferredActionIndex, actions.indices.contains(index) {
            preferredAction = actions[index]
        } else {
            preferredAction = nil
        }
        self.textFieldConfigurationHandlers = textFieldConfigurationHandlers
        self.isSpringLoaded = isSpringLoaded
    }
}


/// A model containing information used to create a UIAlertAction
public struct AlertActionModel {
    let title: String?
    let style: UIAlertAction.Style
    let handler: ((UIAlertAction) -> Void)?
    let isEnabled: Bool
    
    public init(title: String? = nil,
                style: UIAlertAction.Style = .default,
                handler: ((UIAlertAction) -> Void)? = nil,
                isEnabled: Bool = true) {
        self.title = title
        self.style = style
        self.handler = handler
        self.isEnabled = isEnabled
    }
}
