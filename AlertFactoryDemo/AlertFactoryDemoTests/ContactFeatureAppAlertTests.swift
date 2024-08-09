//
//  ContactFeatureAppAlertTests.swift
//  AlertFactoryDemoTests
//
//  Created by Andrew Florjancic on 8/9/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import XCTest
@testable import AlertFactoryDemo

final class ContactFeatureAppAlertTests: XCTestCase {
    
    func testContactUsAlert() throws {
        let sut = AppAlerts.ContactFeature.contactUsAlert(callHandler: nil, emailHandler: nil, reportHandler: nil)
        XCTAssertEqual(sut.title, "Contact Us")
        XCTAssertEqual(sut.message, "Select a method of contact below:")
        XCTAssertEqual(sut.textFields, [])
        XCTAssertEqual(sut.preferredAction, nil)
        XCTAssertEqual(sut.preferredStyle, .actionSheet)
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.severity, .default)
        guard sut.actions.count == 3 else {
            XCTFail("Found \(sut.actions.count) action(s) instead of 3")
            return
        }
        let action1 = sut.actions[0]
        XCTAssertEqual(action1.isEnabled, true)
        XCTAssertEqual(action1.title, "Call")
        XCTAssertEqual(action1.style, .default)
        
        let action2 = sut.actions[1]
        XCTAssertEqual(action2.isEnabled, true)
        XCTAssertEqual(action2.title, "Email")
        XCTAssertEqual(action2.style, .default)
        
        let action3 = sut.actions[2]
        XCTAssertEqual(action3.isEnabled, true)
        XCTAssertEqual(action3.title, "Report a bug")
        XCTAssertEqual(action3.style, .default)
    }
}
