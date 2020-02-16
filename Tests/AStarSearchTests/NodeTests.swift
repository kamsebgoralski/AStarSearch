//
//  NodeTests.swift
//  AStarSearchTests
//
//  Created by Kamil Góralski on 16/02/2020.
//  Copyright © 2020 Kamil Góralski. All rights reserved.
//

import XCTest
@testable import AStarSearch

class NodeTests: XCTestCase {

    func testHashableDifferentRows() {

        let lhs = Node(row: 3, column: 3)
        let rhs = Node(row: 1, column: 3)

        XCTAssertEqual(lhs == rhs, false)
        XCTAssertEqual(lhs.hashValue == rhs.hashValue, false)
    }

    func testHashableDifferentColumns() {

        let lhs = Node(row: 3, column: 3)
        let rhs = Node(row: 3, column: 1)

        XCTAssertEqual(lhs == rhs, false)
        XCTAssertEqual(lhs.hashValue == rhs.hashValue, false)
    }

    func testHashableDifferentRowsAndColumns() {

        let lhs = Node(row: 3, column: 3)
        let rhs = Node(row: 1, column: 1)

        XCTAssertEqual(lhs == rhs, false)
        XCTAssertEqual(lhs.hashValue == rhs.hashValue, false)
    }

    func testHashableTheSameRowsAndColumns() {

        let lhs = Node(row: 3, column: 3)
        let rhs = Node(row: 3, column: 3)

        XCTAssertEqual(lhs == rhs, true)
        XCTAssertEqual(lhs.hashValue == rhs.hashValue, true)
    }

    func testSetParent() {

        let node = Node(row: 1, column: 1)
        let parent = Node(row: 2, column: 2)

        XCTAssertNil(node.parent)
        XCTAssertEqual(node.gCost, 0)
        node.setParent(parent)
        XCTAssertEqual(node.parent, parent)
        XCTAssertEqual(node.gCost, 1)
    }

    func testSetHeuristicCost() {

        let node = Node(row: 1, column: 1)
        let finishNode = Node(row: 4, column: 5)

        XCTAssertEqual(node.heuristicCost, 0)
        node.setHeuristicCost(finishNode: finishNode)
        XCTAssertEqual(node.heuristicCost, 5)
    }

    func testIsLessCost() {

        let parent = Node(row: 1, column: 1)
        parent.setParent(Node(row: 1, column: 2))

        let node = Node(row: 1, column: 3)
        node.setParent(parent)

        let node2 = Node(row: 5, column: 5)

        XCTAssertEqual(node.isLessCost(from: node2), true)
    }

    func testIsNotLessCost() {

        let node = Node(row: 1, column: 1)
        node.setParent(Node(row: 1, column: 2))

        let node2 = Node(row: 5, column: 5)

        XCTAssertEqual(node.isLessCost(from: node2), false)
    }

    func testgIncludingNewCost() {

    }
}
