//
//  Weather_AppTests.swift
//  Weather-AppTests
//
//  Created by Moazam Mir on 1/21/21.
//

import XCTest
@testable import Weather_App

class Weather_AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let weatherService = WeatherService.shared
        let icons = weatherService.icons
        let json = weatherService.json
        XCTAssertNotNil(icons)
        XCTAssertNoThrow(json)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
