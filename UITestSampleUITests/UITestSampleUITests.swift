//
//  UITestSampleUITests.swift
//  UITestSampleUITests
//
//  Created by 塚越啓介 on 2015/06/09.
//  Copyright © 2015年 ktsukago. All rights reserved.
//

import Foundation
import XCTest

class UITestSampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        app.buttons["Name To SecondVC"].tap()
        
        
        let nameToTabBarControllerButton = app.buttons["Name To Tab Bar Controller"]
        nameToTabBarControllerButton.tap()
        
        
        let tabBar = app.tabBars
        tabBar.buttons["Item 2"].tap()
        tabBar.buttons["Item 1"].tap()
        
        
        let backButton = app.navigationBars["UITabBar"].childrenMatchingType(.Button).matchingIdentifier("Back").elementAtIndex(0)
        backButton.tap()
        nameToTabBarControllerButton.tap()
        backButton.tap()
        app.navigationBars["UIView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementAtIndex(0).tap()
        
        
    }
    
}
