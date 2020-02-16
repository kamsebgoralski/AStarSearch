//
//  AStarTests.swift
//  AStarSearchTests
//
//  Created by Kamil Góralski on 16/02/2020.
//  Copyright © 2020 Kamil Góralski. All rights reserved.
//

import XCTest
@testable import AStarSearch

class AStarTests: XCTestCase {

    func testStartNodeAndFinishNodeBeyondSearchArea() {

        let startNode = Node(row: 3, column: -1)
        let finishNode = Node(row: -1, column: 3)
        XCTAssertNil(AStar(rows: 3, columns: 3, startNode: startNode, finishNode: finishNode))
    }

    func testStartNodeBeyondSearchArea() {

        let startNode = Node(row: -1, column: 3)
        let finishNode = Node(row: 2, column: 2)
        XCTAssertNil(AStar(rows: 3, columns: 3, startNode: startNode, finishNode: finishNode))
    }

    func testFinishNodeBeyondSearchArea() {

        let startNode = Node(row: 2, column: 2)
        let finishNode = Node(row: 3, column: -1)
        XCTAssertNil(AStar(rows: 3, columns: 3, startNode: startNode, finishNode: finishNode))
    }

    func testStartNodeAndFinishNodeInSearchArea() {

        let startNode = Node(row: 2, column: 2)
        let finishNode = Node(row: 2, column: 2)
        XCTAssertNotNil(AStar(rows: 3, columns: 3, startNode: startNode, finishNode: finishNode))
    }

    func testSetBlockedNodes() {

        let startNode = Node(row: 0, column: 0)
        let finishNode = Node(row: 1, column: 1)
        let aStar = AStar(rows: 2, columns: 2, startNode: startNode, finishNode: finishNode)

        XCTAssertTrue(aStar?.searchArea[0, 0].type == .normal)
        XCTAssertTrue(aStar?.searchArea[0, 1].type == .normal)
        XCTAssertTrue(aStar?.searchArea[1, 0].type == .normal)
        XCTAssertTrue(aStar?.searchArea[1, 1].type == .normal)

        aStar?.setBlockedNodes(nodes: [Node(row: 0, column: 0), Node(row: 1, column: 0)])

        XCTAssertTrue(aStar?.searchArea[0, 0].type == .blocked)
        XCTAssertFalse(aStar?.searchArea[0, 1].type == .blocked)
        XCTAssertTrue(aStar?.searchArea[1, 0].type == .blocked)
        XCTAssertFalse(aStar?.searchArea[1, 1].type == .blocked)
    }

    func testFindPath() throws {

        let startNode = Node(row: 3, column: 1)
        let finishNode = Node(row: 4, column: 5)

        var aStar = AStar(rows: 6, columns: 6, startNode: startNode, finishNode: finishNode)
        aStar?.setBlockedNodes(nodes:
            [Node(row: 4, column: 1), Node(row: 3, column: 2), Node(row: 2, column: 3), Node(row: 1, column: 4)])

        let path = aStar!.findPath()

        XCTAssertEqual(path[0], Node(row: 3, column: 1))
        XCTAssertEqual(path[1], Node(row: 3, column: 0))
        XCTAssertEqual(path[2], Node(row: 4, column: 0))
        XCTAssertEqual(path[3], Node(row: 5, column: 0))
        XCTAssertEqual(path[4], Node(row: 5, column: 1))
        XCTAssertEqual(path[5], Node(row: 5, column: 2))
        XCTAssertEqual(path[6], Node(row: 5, column: 3))
        XCTAssertEqual(path[7], Node(row: 5, column: 4))
        XCTAssertTrue(path[8] == Node(row: 5, column: 5) || path[8] == Node(row: 4, column: 4))
        XCTAssertEqual(path[9], Node(row: 4, column: 5))

        let path1 = aStar!.findPath()

        XCTAssertEqual(path1[0], Node(row: 3, column: 1))
        XCTAssertEqual(path1[1], Node(row: 3, column: 0))
        XCTAssertEqual(path1[2], Node(row: 4, column: 0))
        XCTAssertEqual(path1[3], Node(row: 5, column: 0))
        XCTAssertEqual(path1[4], Node(row: 5, column: 1))
        XCTAssertEqual(path1[5], Node(row: 5, column: 2))
        XCTAssertEqual(path1[6], Node(row: 5, column: 3))
        XCTAssertEqual(path1[7], Node(row: 5, column: 4))
        XCTAssertTrue(path1[8] == Node(row: 5, column: 5) || path1[8] == Node(row: 4, column: 4))
        XCTAssertEqual(path1[9], Node(row: 4, column: 5))
    }
}
