//
//  AlertFactoryDemoUITests.swift
//  AlertFactoryDemoUITests
//
//  Created by Andrew Florjancic on 8/6/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import XCTest

final class AlertFactoryDemoUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    // MARK: Test Base App Feature
    func testAppLaunch() throws {
        let navBar = app.navigationBars.matching(identifier: "Alert Factory Demo").element
        XCTAssertTrue(navBar.waitForExistence(timeout: 5))
    }
    
    func testWelcomAlertOkAction() throws {
        try app.displayAlert(identifier: .welcome)
        let alert = app.alerts.matching(identifier: AlertIdentifiers.welcome.rawValue).element
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
        try alert.tapAlertAction(identifier: .ok)
        XCTAssertTrue(alert.waitForNonExistence(timeout: 5))
    }
    
    func testDeleteAccountAlertDeleteAction() throws {
        try app.displayAlert(identifier: .deleteAccount)
        let alert = app.alerts.matching(identifier: AlertIdentifiers.deleteAccount.rawValue).element
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
        try alert.tapAlertAction(identifier: .delete)
        XCTAssertTrue(alert.waitForNonExistence(timeout: 5))
    }
    
    func testDeleteAccountAlertCancelAction() throws {
        try app.displayAlert(identifier: .deleteAccount)
        let alert = app.alerts.matching(identifier: AlertIdentifiers.deleteAccount.rawValue).element
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
        try alert.tapAlertAction(identifier: .cancel)
        XCTAssertTrue(alert.waitForNonExistence(timeout: 5))
    }
    
    func testFeedbackAlertYesAction() throws {
        try app.displayAlert(identifier: .feedback)
        let alert = app.alerts.matching(identifier: AlertIdentifiers.feedback.rawValue).element
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
        try alert.tapAlertAction(identifier: .yes)
        XCTAssertTrue(alert.waitForNonExistence(timeout: 5))
    }
    
    func testFeedbackAlertNoAction() throws {
        try app.displayAlert(identifier: .feedback)
        let alert = app.alerts.matching(identifier: AlertIdentifiers.feedback.rawValue).element
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
        try alert.tapAlertAction(identifier: .no)
        XCTAssertTrue(alert.waitForNonExistence(timeout: 5))
    }
    
    // MARK: Test Contact Feature
    func testContactAlertCallAction() throws {
        try app.displayAlert(identifier: .contact)
        let alert = app.otherElements.matching(identifier: AlertIdentifiers.contact.rawValue).element
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
        try alert.tapAlertAction(identifier: .call)
        XCTAssertTrue(alert.waitForNonExistence(timeout: 5))
    }
    
    func testContactAlertEmailAction() throws {
        try app.displayAlert(identifier: .contact)
        let alert = app.otherElements.matching(identifier: AlertIdentifiers.contact.rawValue).element
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
        try alert.tapAlertAction(identifier: .email)
        XCTAssertTrue(alert.waitForNonExistence(timeout: 5))
    }
    
    func testContactAlertReportAction() throws {
        try app.displayAlert(identifier: .contact)
        let alert = app.otherElements.matching(identifier: AlertIdentifiers.contact.rawValue).element
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
        try alert.tapAlertAction(identifier: .bugReport)
        XCTAssertTrue(alert.waitForNonExistence(timeout: 5))
    }
    
    // MARK: Test Survey Feature
    
    func testNewNameAlertCancelAction() throws {
        try app.displayAlert(identifier: .newName)
        let alert = app.alerts.matching(identifier: AlertIdentifiers.newName.rawValue).element
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
        try alert.tapAlertAction(identifier: .cancel)
        XCTAssertTrue(alert.waitForNonExistence(timeout: 5))
    }
    
    func testNewNameAlertSubmitAction() throws {
        try app.displayAlert(identifier: .newName)
        let alert = app.alerts.matching(identifier: AlertIdentifiers.newName.rawValue).element
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
        try alert.tapAlertAction(identifier: .submit)
        XCTAssertTrue(alert.waitForNonExistence(timeout: 5))
    }
}


extension XCUIElement {
    
    /// Waits the specified amount of time for the element's exist property to be false and returns false if the timeout expires and the element still exists.
    /// Wait until the element no longer exists
    /// - Parameter timeout: Length of time to wait for the element to no longer exists.
    /// - Returns: True if the element no longer exists, false if the element still exists after the timeout has expired.
    func waitForNonExistence(timeout: TimeInterval) -> Bool {
        let predicate = NSPredicate(format: "exists == false")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
        return XCTWaiter.wait(for: [expectation], timeout: timeout) == .completed
    }
    
    /// Taps on the action if it is hittable, otherwise fails the test
    /// - Parameter identifier: The accessibility identifier assocaited with the action being tested
    func tapAlertAction(identifier: ActionIdentifiers) throws {
        let action = buttons.matching(identifier: identifier.rawValue).element
        XCTAssertTrue(action.waitForExistence(timeout: 5))
        XCTAssert(action.isHittable)
        action.tap()
    }
    
    /// Taps on the tableview cell to display the alert associated with the identiifer. Fails the test if the cell cannot be found.
    /// - Parameter identifier: The accessibility identifier associated with the alert
    func displayAlert(identifier: AlertIdentifiers) throws {
        let cell = cells.matching(identifier: identifier.rawValue).element
        XCTAssertTrue(cell.waitForExistence(timeout: 5))
        XCTAssertTrue(cell.isHittable)
        cell.tap()
    }
}

/// Alll of the accessibility identifiers assigned to alerts being tested
enum AlertIdentifiers: String {
    case welcome, feedback, deleteAccount, contact, newName
}

/// All of the accessibility identifiers assigned to actions being tested
enum ActionIdentifiers: String {
    case ok, yes, no, cancel, delete, call, email, bugReport, submit
}
