//
//  SurveyFeatureAppAlertTests.swift
//  AlertFactoryDemoTests
//
//  Created by Andrew Florjancic on 8/9/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import XCTest
@testable import AlertFactoryDemo

final class SurveyFeatureAppAlertTests: XCTestCase {
    
    func testNewNameSurveyAlert() throws {
        let sut = AppAlerts.SurveyFeature.newNameSurveyAlert(submitHandler: nil, nameHandler: nil)
        XCTAssertEqual(sut.title, "New Name?")
        XCTAssertEqual(sut.message, "We're thinking about renaming the Alert Factory app. What name do you think we should use?")
        XCTAssertEqual(sut.textFields?.count, 1)
        XCTAssertEqual(sut.preferredAction, nil)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.severity, .default)
        guard sut.actions.count == 2 else {
            XCTFail("Found \(sut.actions.count) action(s) instead of 2")
            return
        }
        let action1 = sut.actions[0]
        XCTAssertEqual(action1.isEnabled, true)
        XCTAssertEqual(action1.title, "Submit")
        XCTAssertEqual(action1.style, .default)
        
        let action2 = sut.actions[1]
        XCTAssertEqual(action2.isEnabled, true)
        XCTAssertEqual(action2.title, "Cancel")
        XCTAssertEqual(action2.style, .cancel)
    }
}
