//
//  ShoppingListItemFeatureTest.swift
//  DinnergyUITests
//
//  Created by Simon 易 on 19/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import XCTest

class ShoppingListItemFeatureTest: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testDeleteItem() {
        let app = XCUIApplication()
        
        addBananas(number: "3")
        
        app.buttons["Recipes"].tap()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        
        let scrollViewsQuery = app.scrollViews
        let veganBananaBreadElement = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Vegan Banana Bread").element
        veganBananaBreadElement.swipeUp()
        
        app.buttons["Add to List"].tap()
        app.alerts["Added to List"].buttons["Dismiss"].tap()
        app.tabBars.buttons["Shopping"].tap()
        XCTAssertTrue(app.staticTexts["Bananas: 3.0 large"].exists)
        
        XCUIApplication().tables.staticTexts["Bananas: 3.0 large"].swipeLeft()
        XCUIApplication().tables.buttons["Delete"].tap()
        
        XCTAssertFalse(app.staticTexts["Bananas: 3.0 large"].exists)
        
        
    }
    


}
