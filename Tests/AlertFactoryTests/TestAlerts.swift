//
//  TestAlerts.swift
//  AlertFactoryTests
//
//  Created by Andrew Florjancic on 8/10/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import Foundation
@testable import AlertFactory


/// All possible alerts for testing
enum TestAlerts: Alert {

    case springLoadedAlertDefaultSeverityWithMessage
    case springLoadedAlertDefaultSeverityWithoutMessage
    case springLoadedActionSheetDefaultSeverityWithMessage
    case springLoadedActionSheetDefaultSeverityWithoutMessage
    case springLoadedAlertCriticalSeverityWithMessage
    case springLoadedAlertCriticalSeverityWithoutMessage
    case springLoadedActionSheetCriticalSeverityWithMessage
    case springLoadedActionSheetCriticalSeverityWithoutMessage
    case nonSpringLoadedAlertDefaultSeverityWithMessage
    case nonSpringLoadedAlertDefaultSeverityWithoutMessage
    case nonSpringLoadedActionSheetDefaultSeverityWithMessage
    case nonSpringLoadedActionSheetDefaultSeverityWithoutMessage
    case nonSpringLoadedAlertCriticalSeverityWithMessage
    case nonSpringLoadedAlertCriticalSeverityWithoutMessage
    case nonSpringLoadedActionSheetCriticalSeverityWithMessage
    case nonSpringLoadedActionSheetCriticalSeverityWithoutMessage
    case defaultParameters
    
    var model: AlertModel {
        switch self {
        case .springLoadedAlertDefaultSeverityWithMessage:
            return .init(title: "Spring Loaded - Alert - Default Severity - With Message",
                         message: "Sample message",
                         preferredStyle: .alert,
                         severity: .default,
                         isSpringLoaded: true)
        case .springLoadedAlertDefaultSeverityWithoutMessage:
            return .init(title: "Spring Loaded - Alert - Default Severity - Without Message",
                         message: nil,
                         preferredStyle: .alert,
                         severity: .default,
                         isSpringLoaded: true)
        case .springLoadedActionSheetDefaultSeverityWithMessage:
            return .init(title: "Spring Loaded - Action Sheet - Default Severity - With Message",
                         message: "Sample message",
                         preferredStyle: .actionSheet,
                         severity: .default,
                         isSpringLoaded: true)
        case .springLoadedActionSheetDefaultSeverityWithoutMessage:
            return .init(title: "Spring Loaded - Action Sheet - Default Severity - Without Message",
                         message: nil,
                         preferredStyle: .actionSheet,
                         severity: .default,
                         isSpringLoaded: true)
        case .springLoadedAlertCriticalSeverityWithMessage:
            return .init(title: "Spring Loaded - Alert - Critical Severity - With Message",
                         message: "Sample message",
                         preferredStyle: .alert,
                         severity: .critical,
                         isSpringLoaded: true)
        case .springLoadedAlertCriticalSeverityWithoutMessage:
            return .init(title: "Spring Loaded - Alert - Critical Severity - Without Message",
                         message: nil,
                         preferredStyle: .alert,
                         severity: .critical,
                         isSpringLoaded: true)
        case .springLoadedActionSheetCriticalSeverityWithMessage:
            return .init(title: "Spring Loaded - Action Sheet - Critical Severity - With Message",
                         message: "Sample message",
                         preferredStyle: .actionSheet,
                         severity: .critical,
                         isSpringLoaded: true)
        case .springLoadedActionSheetCriticalSeverityWithoutMessage:
            return .init(title: "Spring Loaded - Action Sheet - Critical Severity - Without Message",
                         message: nil,
                         preferredStyle: .actionSheet,
                         severity: .critical,
                         isSpringLoaded: true)
        case .nonSpringLoadedAlertDefaultSeverityWithMessage:
            return .init(title: "Non Spring Loaded - Alert - Default Severity - With Message",
                         message: "Sample message",
                         preferredStyle: .alert,
                         severity: .default,
                         isSpringLoaded: false)
        case .nonSpringLoadedAlertDefaultSeverityWithoutMessage:
            return .init(title: "Non Spring Loaded - Alert - Default Severity - Without Message",
                         message: nil,
                         preferredStyle: .alert,
                         severity: .default,
                         isSpringLoaded: false)
        case .nonSpringLoadedActionSheetDefaultSeverityWithMessage:
            return .init(title: "Non Spring Loaded - Action Sheet - Default Severity - With Message",
                         message: "Sample message",
                         preferredStyle: .actionSheet,
                         severity: .default,
                         isSpringLoaded: false)
        case .nonSpringLoadedActionSheetDefaultSeverityWithoutMessage:
            return .init(title: "Non Spring Loaded - Action Sheet - Default Severity - Without Message",
                         message: nil,
                         preferredStyle: .actionSheet,
                         severity: .default,
                         isSpringLoaded: false)
        case .nonSpringLoadedAlertCriticalSeverityWithMessage:
            return .init(title: "Non Spring Loaded - Alert - Critical Severity - With Message",
                         message: "Sample message",
                         preferredStyle: .alert,
                         severity: .critical,
                         isSpringLoaded: false)
        case .nonSpringLoadedAlertCriticalSeverityWithoutMessage:
            return .init(title: "Non Spring Loaded - Alert - Critical Severity - Without Message",
                         message: nil,
                         preferredStyle: .alert,
                         severity: .critical,
                         isSpringLoaded: false)
        case .nonSpringLoadedActionSheetCriticalSeverityWithMessage:
            return .init(title: "Non Spring Loaded - Action Sheet - Critical Severity - With Message",
                         message: "Sample message",
                         preferredStyle: .actionSheet,
                         severity: .critical,
                         isSpringLoaded: false)
        case .nonSpringLoadedActionSheetCriticalSeverityWithoutMessage:
            return .init(title: "Non Spring Loaded - Action Sheet - Critical Severity - Without Message",
                         message: nil,
                         preferredStyle: .actionSheet,
                         severity: .critical,
                         isSpringLoaded: false)
        case .defaultParameters: return .init(title: "Default Parameters")
        }
    }
}

/// All possible actions for testing
enum TestActions: Action {
    case defaultEnabled, defaultDisabled, cancelEnabled, cancelDisabled, destructiveEnabled, destructiveDisabled, defaultParameters
    
    var model: ActionModel {
        switch self {
        case .defaultEnabled: return .init(title: "Default Enabled", style: .default, isEnabled: true)
        case .defaultDisabled: return .init(title: "Default Disabled", style: .default, isEnabled: false)
        case .cancelEnabled: return .init(title: "Cancel Enabled", style: .cancel, isEnabled: true)
        case .cancelDisabled: return .init(title: "Cancel Disabled", style: .cancel, isEnabled: false)
        case .destructiveEnabled: return .init(title: "Destructive Enabled", style: .destructive, isEnabled: true)
        case .destructiveDisabled: return .init(title: "Destructive Disabled", style: .destructive, isEnabled: false)
        case .defaultParameters: return .init(title: "Default Parameters")
        }
    }
}
