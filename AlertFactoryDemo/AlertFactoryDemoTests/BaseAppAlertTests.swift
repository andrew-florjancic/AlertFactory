//
//  BaseAppAlertTests.swift
//  AlertFactoryDemoTests
//
//  Created by Andrew Florjancic on 8/6/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import XCTest
@testable import AlertFactoryDemo

final class BaseAppAlertTests: XCTestCase {

    func testWelcomeAlert() throws {
       let sut = AppAlerts.BaseApp.welcomeAlert()
        XCTAssertEqual(sut.title, "Hello!")
        XCTAssertEqual(sut.message, "Welcome to the Alert Factory Demo App")
        XCTAssertEqual(sut.textFields, [])
        XCTAssertEqual(sut.preferredAction, nil)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.severity, .default)
        guard sut.actions.count == 1 else {
            XCTFail("Found \(sut.actions.count) action(s) instead of 1")
            return
        }
        let action1 = sut.actions[0]
        XCTAssertEqual(action1.isEnabled, true)
        XCTAssertEqual(action1.title, "Ok")
        XCTAssertEqual(action1.style, .default)
    }
    
    func testFeedbackAlert() throws {
       let sut = AppAlerts.BaseApp.feedbackAlert(yesHandler: nil, noHandler: nil)
        XCTAssertEqual(sut.title, "Are you enjoying this demo?")
        XCTAssertEqual(sut.message, nil)
        XCTAssertEqual(sut.textFields, [])
        XCTAssertEqual(sut.preferredAction, nil)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.severity, .default)
        guard sut.actions.count == 2 else {
            XCTFail("Found \(sut.actions.count) action(s) instead of 1")
            return
        }
        let action1 = sut.actions[0]
        XCTAssertEqual(action1.isEnabled, true)
        XCTAssertEqual(action1.title, "Yes")
        XCTAssertEqual(action1.style, .default)
        
        let action2 = sut.actions[1]
        XCTAssertEqual(action2.isEnabled, true)
        XCTAssertEqual(action2.title, "No")
        XCTAssertEqual(action2.style, .default)
    }
    
    func testDeleteAccountAlert() throws {
       let sut = AppAlerts.BaseApp.deleteAccount(deleteHandler: nil)
        XCTAssertEqual(sut.title, "Confirm deletion of your account")
        XCTAssertEqual(sut.message, nil)
        XCTAssertEqual(sut.textFields, [])
        XCTAssertEqual(sut.preferredAction, nil)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.severity, .default)
        guard sut.actions.count == 2 else {
            XCTFail("Found \(sut.actions.count) action(s) instead of 1")
            return
        }
        let action1 = sut.actions[0]
        XCTAssertEqual(action1.isEnabled, true)
        XCTAssertEqual(action1.title, "Delete")
        XCTAssertEqual(action1.style, .destructive)
        
        let action2 = sut.actions[1]
        XCTAssertEqual(action2.isEnabled, true)
        XCTAssertEqual(action2.title, "Cancel")
        XCTAssertEqual(action2.style, .cancel)
    }
}
