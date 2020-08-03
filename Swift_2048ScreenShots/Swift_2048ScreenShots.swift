//
//  Swift_2048ScreenShots.swift
//  Swift_2048ScreenShots
//
//  Created by Eric Rolf on 8/26/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import XCTest

class Swift_2048ScreenShots: XCTestCase {

    override func setUp() {
        continueAfterFailure = false

        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPortraitScreenshots() {
        XCUIDevice.shared.orientation = .portrait

        snapshot("0-First-screen-portrait")

        navigateToInsights()

        snapshot("0-Insights-screen-portrait")
    }

    func testLandscapeScreenshots() {

        XCUIDevice.shared.orientation = .landscapeLeft

        snapshot("0-Main-screen-lanscape")

        navigateToInsights()

        snapshot("0-Insights-screen-landscape")
    }

    func navigateToInsights() {
        let app = XCUIApplication()
        app.swipeRight()
        app.swipeDown()
        app.buttons["Insights"].tap()

    }

}
