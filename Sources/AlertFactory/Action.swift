//
//  Action.swift
//  AlertFactory
//
//  Created by Andrew Florjancic on 8/10/24.
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
    public func create(handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: model.title, style: model.style, handler: handler)
        action.isEnabled = model.isEnabled
        action.accessibilityIdentifier = String(describing: self)
        return action
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
