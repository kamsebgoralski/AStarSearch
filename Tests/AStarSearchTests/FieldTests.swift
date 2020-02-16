//
//  FieldTests.swift
//  AStarSearchTests
//
//  Created by Kamil Góralski on 16/02/2020.
//  Copyright © 2020 Kamil Góralski. All rights reserved.
//

import XCTest
@testable import AStarSearch

class FieldTests: XCTestCase {

    func testSetBlocked() {

        var field = Field(type: .normal)

        XCTAssertEqual(field.type, .normal)
        field.setBlocked()
        XCTAssertEqual(field.type, .blocked)
    }
}
