//
//  ActionTests.swift
//  AlertFactoryTests
//
//  Created by Andrew Florjancic on 8/10/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import XCTest
@testable import AlertFactory

final class ActionTests: XCTestCase {
    
    var sut: UIAlertAction!
    
    func testCreateActions() throws {
        
        sut = TestActions.defaultEnabled.create()
        XCTAssertEqual(sut.title, "Default Enabled")
        XCTAssertEqual(sut.style, .default)
        XCTAssertEqual(sut.isEnabled, true)
        XCTAssertEqual(sut.accessibilityIdentifier, String(describing: TestActions.defaultEnabled))
        
        sut = TestActions.defaultDisabled.create()
        XCTAssertEqual(sut.title, "Default Disabled")
        XCTAssertEqual(sut.style, .default)
        XCTAssertEqual(sut.isEnabled, false)
        XCTAssertEqual(sut.accessibilityIdentifier, String(describing: TestActions.defaultDisabled))
        
        sut = TestActions.cancelEnabled.create()
        XCTAssertEqual(sut.title, "Cancel Enabled")
        XCTAssertEqual(sut.style, .cancel)
        XCTAssertEqual(sut.isEnabled, true)
        XCTAssertEqual(sut.accessibilityIdentifier, String(describing: TestActions.cancelEnabled))
        
        sut = TestActions.cancelDisabled.create()
        XCTAssertEqual(sut.title, "Cancel Disabled")
        XCTAssertEqual(sut.style, .cancel)
        XCTAssertEqual(sut.isEnabled, false)
        XCTAssertEqual(sut.accessibilityIdentifier, String(describing: TestActions.cancelDisabled))
        
        sut = TestActions.destructiveEnabled.create()
        XCTAssertEqual(sut.title, "Destructive Enabled")
        XCTAssertEqual(sut.style, .destructive)
        XCTAssertEqual(sut.isEnabled, true)
        XCTAssertEqual(sut.accessibilityIdentifier, String(describing: TestActions.destructiveEnabled))
        
        sut = TestActions.destructiveDisabled.create()
        XCTAssertEqual(sut.title, "Destructive Disabled")
        XCTAssertEqual(sut.style, .destructive)
        XCTAssertEqual(sut.isEnabled, false)
        XCTAssertEqual(sut.accessibilityIdentifier, String(describing: TestActions.destructiveDisabled))
        
        sut = TestActions.defaultParameters.create()
        XCTAssertEqual(sut.title, "Default Parameters")
        XCTAssertEqual(sut.style, .default)
        XCTAssertEqual(sut.isEnabled, true)
        XCTAssertEqual(sut.accessibilityIdentifier, String(describing: TestActions.defaultParameters))
    }
}
