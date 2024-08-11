//
//  ActionModelTests.swift
//  AlertFactoryTests
//
//  Created by Andrew Florjancic on 8/10/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import XCTest
@testable import AlertFactory

final class ActionModelTests: XCTestCase {
    
    var sut: ActionModel!
    
    func testActionModels() throws {
        
        sut = TestActions.defaultEnabled.model
        XCTAssertEqual(sut.title, "Default Enabled")
        XCTAssertEqual(sut.style, .default)
        XCTAssertEqual(sut.isEnabled, true)
        
        sut = TestActions.defaultDisabled.model
        XCTAssertEqual(sut.title, "Default Disabled")
        XCTAssertEqual(sut.style, .default)
        XCTAssertEqual(sut.isEnabled, false)
        
        sut = TestActions.cancelEnabled.model
        XCTAssertEqual(sut.title, "Cancel Enabled")
        XCTAssertEqual(sut.style, .cancel)
        XCTAssertEqual(sut.isEnabled, true)
        
        sut = TestActions.cancelDisabled.model
        XCTAssertEqual(sut.title, "Cancel Disabled")
        XCTAssertEqual(sut.style, .cancel)
        XCTAssertEqual(sut.isEnabled, false)
        
        sut = TestActions.destructiveEnabled.model
        XCTAssertEqual(sut.title, "Destructive Enabled")
        XCTAssertEqual(sut.style, .destructive)
        XCTAssertEqual(sut.isEnabled, true)
        
        sut = TestActions.destructiveDisabled.model
        XCTAssertEqual(sut.title, "Destructive Disabled")
        XCTAssertEqual(sut.style, .destructive)
        XCTAssertEqual(sut.isEnabled, false)
        
        sut = TestActions.defaultParameters.model
        XCTAssertEqual(sut.title, "Default Parameters")
        XCTAssertEqual(sut.style, .default)
        XCTAssertEqual(sut.isEnabled, true)
    }
}
