//
//  MatrixTests.swift
//  AStarSearchTests
//
//  Created by Kamil Góralski on 16/02/2020.
//  Copyright © 2020 Kamil Góralski. All rights reserved.
//

import XCTest
@testable import AStarSearch

class MatrixTests: XCTestCase {

    func testInit() {

        let matrix = Matrix(rows: 5, columns: 5, defaultValue: 3)

        XCTAssertEqual(matrix.grid.count, 25)
    }

    func testMatrixIndexInRange() {

        let matrix = Matrix(rows: 5, columns: 5, defaultValue: 3)

        XCTAssertEqual(matrix.indexInRange(row: 4, column: 4), true)
        XCTAssertEqual(matrix.indexInRange(row: 0, column: 0), true)
    }

    func testMatrixIndexOutOfRange() {

        let matrix = Matrix(rows: 5, columns: 5, defaultValue: 3)

        XCTAssertEqual(matrix.indexInRange(row: 5, column: 5), false)
        XCTAssertEqual(matrix.indexInRange(row: 5, column: 4), false)
        XCTAssertEqual(matrix.indexInRange(row: 4, column: 5), false)
        XCTAssertEqual(matrix.indexInRange(row: -1, column: -1), false)
        XCTAssertEqual(matrix.indexInRange(row: -1, column: 0), false)
        XCTAssertEqual(matrix.indexInRange(row: 0, column: -1), false)
    }

    func testMatrixSubscribtGet() {

        let matrix = Matrix(rows: 5, columns: 5, defaultValue: 3)

        XCTAssertEqual(matrix[0, 0], 3)
        XCTAssertEqual(matrix[3, 3], 3)
        XCTAssertEqual(matrix[4, 4], 3)
    }

    func testMatrixSubscribtSet() {

        let matrix = Matrix(rows: 5, columns: 5, defaultValue: 3)

        XCTAssertEqual(matrix[2, 2], 3)
        matrix[2, 2] = 10
        XCTAssertEqual(matrix[2, 2], 10)
        XCTAssertNotEqual(matrix[3, 3], 10)
    }
}
