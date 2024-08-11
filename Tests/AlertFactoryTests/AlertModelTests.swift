//
//  AlertModelTests.swift
//  AlertFactoryTests
//  
//
//  Created by Andrew Florjancic on 8/10/24.
//  Copyright © 2024 Andrew Florjancic. All rights reserved.
//

import XCTest
@testable import AlertFactory

final class AlertModelTests: XCTestCase {
    
    var sut: AlertModel!
    
    func testAlertModels() throws {

        sut = TestAlerts.springLoadedAlertDefaultSeverityWithMessage.model
        XCTAssertEqual(sut.title, "Spring Loaded - Alert - Default Severity - With Message")
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.severity, .default)
        XCTAssertEqual(sut.message, "Sample message")
        
        sut = TestAlerts.springLoadedAlertDefaultSeverityWithoutMessage.model
        XCTAssertEqual(sut.title, "Spring Loaded - Alert - Default Severity - Without Message")
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.severity, .default)
        XCTAssertEqual(sut.message, nil)
        
        sut = TestAlerts.springLoadedActionSheetDefaultSeverityWithMessage.model
        XCTAssertEqual(sut.title, "Spring Loaded - Action Sheet - Default Severity - With Message")
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.preferredStyle, .actionSheet)
        XCTAssertEqual(sut.severity, .default)
        XCTAssertEqual(sut.message, "Sample message")
        
        sut = TestAlerts.springLoadedActionSheetDefaultSeverityWithoutMessage.model
        XCTAssertEqual(sut.title, "Spring Loaded - Action Sheet - Default Severity - Without Message")
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.preferredStyle, .actionSheet)
        XCTAssertEqual(sut.severity, .default)
        XCTAssertEqual(sut.message, nil)
        
        sut = TestAlerts.springLoadedAlertCriticalSeverityWithMessage.model
        XCTAssertEqual(sut.title, "Spring Loaded - Alert - Critical Severity - With Message")
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.severity, .critical)
        XCTAssertEqual(sut.message, "Sample message")
        
        sut = TestAlerts.springLoadedAlertCriticalSeverityWithoutMessage.model
        XCTAssertEqual(sut.title, "Spring Loaded - Alert - Critical Severity - Without Message")
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.severity, .critical)
        XCTAssertEqual(sut.message, nil)
        
        sut = TestAlerts.springLoadedActionSheetCriticalSeverityWithMessage.model
        XCTAssertEqual(sut.title, "Spring Loaded - Action Sheet - Critical Severity - With Message")
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.preferredStyle, .actionSheet)
        XCTAssertEqual(sut.severity, .critical)
        XCTAssertEqual(sut.message, "Sample message")
        
        sut = TestAlerts.springLoadedActionSheetCriticalSeverityWithoutMessage.model
        XCTAssertEqual(sut.title, "Spring Loaded - Action Sheet - Critical Severity - Without Message")
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.preferredStyle, .actionSheet)
        XCTAssertEqual(sut.severity, .critical)
        XCTAssertEqual(sut.message, nil)
        
        sut = TestAlerts.nonSpringLoadedAlertDefaultSeverityWithMessage.model
        XCTAssertEqual(sut.title, "Non Spring Loaded - Alert - Default Severity - With Message")
        XCTAssertEqual(sut.isSpringLoaded, false)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.severity, .default)
        XCTAssertEqual(sut.message, "Sample message")
        
        sut = TestAlerts.nonSpringLoadedAlertDefaultSeverityWithoutMessage.model
        XCTAssertEqual(sut.title, "Non Spring Loaded - Alert - Default Severity - Without Message")
        XCTAssertEqual(sut.isSpringLoaded, false)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.severity, .default)
        XCTAssertEqual(sut.message, nil)
        
        sut = TestAlerts.nonSpringLoadedActionSheetDefaultSeverityWithMessage.model
        XCTAssertEqual(sut.title, "Non Spring Loaded - Action Sheet - Default Severity - With Message")
        XCTAssertEqual(sut.isSpringLoaded, false)
        XCTAssertEqual(sut.preferredStyle, .actionSheet)
        XCTAssertEqual(sut.severity, .default)
        XCTAssertEqual(sut.message, "Sample message")
        
        sut = TestAlerts.nonSpringLoadedActionSheetDefaultSeverityWithoutMessage.model
        XCTAssertEqual(sut.title, "Non Spring Loaded - Action Sheet - Default Severity - Without Message")
        XCTAssertEqual(sut.isSpringLoaded, false)
        XCTAssertEqual(sut.preferredStyle, .actionSheet)
        XCTAssertEqual(sut.severity, .default)
        XCTAssertEqual(sut.message, nil)
        
        sut = TestAlerts.nonSpringLoadedAlertCriticalSeverityWithMessage.model
        XCTAssertEqual(sut.title, "Non Spring Loaded - Alert - Critical Severity - With Message")
        XCTAssertEqual(sut.isSpringLoaded, false)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.severity, .critical)
        XCTAssertEqual(sut.message, "Sample message")
        
        sut = TestAlerts.nonSpringLoadedAlertCriticalSeverityWithoutMessage.model
        XCTAssertEqual(sut.title, "Non Spring Loaded - Alert - Critical Severity - Without Message")
        XCTAssertEqual(sut.isSpringLoaded, false)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.severity, .critical)
        XCTAssertEqual(sut.message, nil)
        
        sut = TestAlerts.nonSpringLoadedActionSheetCriticalSeverityWithMessage.model
        XCTAssertEqual(sut.title, "Non Spring Loaded - Action Sheet - Critical Severity - With Message")
        XCTAssertEqual(sut.isSpringLoaded, false)
        XCTAssertEqual(sut.preferredStyle, .actionSheet)
        XCTAssertEqual(sut.severity, .critical)
        XCTAssertEqual(sut.message, "Sample message")
        
        sut = TestAlerts.nonSpringLoadedActionSheetCriticalSeverityWithoutMessage.model
        XCTAssertEqual(sut.title, "Non Spring Loaded - Action Sheet - Critical Severity - Without Message")
        XCTAssertEqual(sut.isSpringLoaded, false)
        XCTAssertEqual(sut.preferredStyle, .actionSheet)
        XCTAssertEqual(sut.severity, .critical)
        XCTAssertEqual(sut.message, nil)
        
        sut = TestAlerts.defaultParameters.model
        XCTAssertEqual(sut.title, "Default Parameters")
        XCTAssertEqual(sut.isSpringLoaded, true)
        XCTAssertEqual(sut.preferredStyle, .alert)
        XCTAssertEqual(sut.severity, .default)
        XCTAssertEqual(sut.message, nil)
    }
}
