//
//  JeenyTaskTests.swift
//  JeenyTaskTests
//
//  Created by Afaq Ahmad on 05/09/2020.
//  Copyright © 2020 Afaq Ahmad. All rights reserved.
//

import XCTest
import PKHUD
@testable import JeenyTask

class JeenyTaskTests: XCTestCase {

    var viewController: BooksVC!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BooksVC") as? BooksVC

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewController = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testNavigationTitle() {
      // 1. given
        let item = "Google Books"
      // 2. when
        viewController.setNavigationTitle()
      // 3. then
        XCTAssertEqual("\(viewController.navigationItem.title ?? "")", item)
    }
    
    func testItemCount() {
      // 1. given
        let item = HUD.isVisible
      // 2. when
        viewController.showHUD()
      // 3. then
        XCTAssertEqual(true, item)
    }

}
