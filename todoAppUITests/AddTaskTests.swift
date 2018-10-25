//
//  AddTaskTests.swift
//  todoAppUITests
//
//  Created by Jason Chow on 10/24/18.
//  Copyright © 2018 Jason Chow. All rights reserved.
//

import XCTest


class AddTask: XCTestCase {
    
    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    
        let app = XCUIApplication()
        app.launchArguments = ["UI-TESTING"]
        app.launch()

        let typeSomething = app.textFields["Add Task Here..."]
        typeSomething.tap()
        typeSomething.typeText("test 1")
        app.buttons["+ ADD TASK"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["test 1"]/*[[".cells.staticTexts[\"test 1\"]",".staticTexts[\"test 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let testAddTask = app.tables/*@START_MENU_TOKEN@*/.staticTexts["test 1"]/*[[".cells.staticTexts[\"test 1\"]",".staticTexts[\"test 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertEqual("test 1", testAddTask.label)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
