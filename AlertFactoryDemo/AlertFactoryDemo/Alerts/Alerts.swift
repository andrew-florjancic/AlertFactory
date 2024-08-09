//
//  AppAlerts.swift
//  AlertFactoryDemo
//
//  Created by Andrew Florjancic on 8/7/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import UIKit
import AlertFactory

/// Alerts for use in the application
enum AppAlerts {
    
    /// A set of alerts used throughout the application not specific to a single feature
    enum BaseApp {
        
        /// Prebuilt `AlertFactory.Alert`s for the base application
        fileprivate enum Alerts: Alert {
            case welcome, feedback, deleteAccount
            
            internal var model: AlertModel {
                switch self {
                case .welcome: return AlertModel(title: "Hello!", message: "Welcome to the Alert Factory Demo App")
                case .feedback: return AlertModel(title: "Are you enjoying this demo?")
                case .deleteAccount: return AlertModel(title: "Confirm deletion of your account")
                }
            }
        }
        
        /// Prebuilt `AlertFactory.Action`s for the base application
        fileprivate enum Actions: Action {
            case ok, yes, no, cancel, delete
            
            internal var model: ActionModel {
                switch self {
                case .ok: return ActionModel(title: "Ok", style: .default)
                case .yes: return ActionModel(title: "Yes", style: .default)
                case .no: return ActionModel(title: "No", style: .default)
                case .cancel: return ActionModel(title: "Cancel", style: .cancel)
                case .delete: return ActionModel(title: "Delete", style: .destructive)
                }
            }
        }
    
        /// Creates the welcome alert
        /// - Returns: A `UIAlertController` populated with a welcome message.
        static func welcomeAlert() -> UIAlertController {
            let okAction = Actions.ok.create(handler: nil)
            return Alerts.welcome.create(actions: [okAction])
        }
        
        /// Creates the feedback alert
        /// - Parameters:
        ///   - yesHandler: A block of code to execute when the yes action is selected.
        ///   - noHandler: A block of code to execute when the no action is selected.
        /// - Returns: A `UIAlertController` populated with a feedback message and actions.
        static func feedbackAlert(yesHandler: ((UIAlertAction) -> Void)?
                                  ,noHandler: ((UIAlertAction) -> Void)?) -> UIAlertController {
            let yesAction = Actions.yes.create(handler: yesHandler)
            let noAction = Actions.no.create(handler: noHandler)
            return Alerts.feedback.create(actions: [yesAction, noAction])
        }
        
        /// Creates the delete account alert
        /// - Parameters:
        ///   - deleteHandler: A block of code to execute when the delete action is selected.
        /// - Returns: A `UIAlertController` populated with a delete account message and actions.
        static func deleteAccount(deleteHandler: ((UIAlertAction) -> Void)?) -> UIAlertController {
            let deleteAction = Actions.delete.create(handler: deleteHandler)
            let cancelAction = Actions.cancel.create(handler: nil)
            return Alerts.deleteAccount.create(actions: [deleteAction, cancelAction])
        }
    }
}


// MARK: App Alerts for the 'Contact Feature'
extension AppAlerts {
    
    enum ContactFeature {
        
        /// Prebuilt `AlertFactory.Alert`s for the `Contact Feature`
        fileprivate enum Alerts: Alert {
            case contact
            
            internal var model: AlertModel {
                switch self {
                case .contact: return AlertModel(title: "Contact Us", message: "Select an option below to reach out", preferredStyle: .actionSheet)
                }
            }
        }
        
        /// Prebuilt `AlertFactory.Action`s for the `Contact Feature`
        fileprivate enum Actions: Action {
            case call
            case email
            case bugReport
            internal var model: ActionModel {
                switch self {
                case .call: return ActionModel(title: "Call", style: .default)
                case .email: return ActionModel(title: "Email", style: .default)
                case .bugReport: return ActionModel(title: "Report a bug", style: .default)
                }
            }
        }
        
        /// Cereates the contact us alert
        /// - Parameters:
        ///   - callHandler: A block of code to execute when the call action is selected.
        ///   - emailHandler: A block of code to execute when the email action is selected.
        ///   - reportHandler: A block of code to execute when the bug report action is selected.
        /// - Returns: A `UIAlertController` populated with a contact us message and actions.
        static func contactUsAlert(callHandler: ((UIAlertAction) -> Void)?,
                                   emailHandler: ((UIAlertAction) -> Void)?,
                                   reportHandler: ((UIAlertAction) -> Void)?) -> UIAlertController {
            let callAction = Actions.call.create(handler: callHandler)
            let emailAction = Actions.email.create(handler: emailHandler)
            let reportAction = Actions.bugReport.create(handler: reportHandler)
            return Alerts.contact.create(actions: [callAction, emailAction, reportAction])
        }
    }
}


// MARK: Feature 2 App alerts
extension AppAlerts {
    
    enum SurveyFeature {
        
        /// Prebuilt `AlertFactory.Alerts`s for the `Survey Feature`
        fileprivate enum Alerts: Alert {
            case newName
            
            internal var model: AlertFactory.AlertModel {
                switch self {
                case .newName: return AlertFactory.AlertModel(title: "New Name?", message: "We're thinking about renaming the Alert Factory app. What name do you think we should use?")
                }
            }
        }
        
        /// Prebuilt `AlertFactory.Action`s for the `Survey Feature`
        fileprivate enum Actions: AlertFactory.Action {
            case submit
            
            internal var model: AlertFactory.ActionModel {
                switch self {
                case .submit: return AlertFactory.ActionModel(title: "Submit", style: .default)
                }
            }
        }
        
        /// Creates the new name survey alert
        /// - Parameters:
        ///   - submitHandler: A block of code to execute when the submit action is selected.
        ///   - nameHandler: A block of code to interact with the textfield on the alert.
        /// - Returns: A `UIAlertController` populated with the new name survey message and actions.
        static func newNameSurveyAlert(submitHandler: ((UIAlertAction) -> Void)?,
                                       nameHandler: ((UITextField) -> Void)?) -> UIAlertController {
            let submitAction = Actions.submit.create(handler: submitHandler)
            let cancelAction = BaseApp.Actions.cancel.create(handler: nil)
            let alert = Alerts.newName.create(actions: [submitAction, cancelAction], textFieldHandlers: [nameHandler])
            return alert
        }
    }
}
