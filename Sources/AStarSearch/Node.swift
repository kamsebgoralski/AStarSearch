//
//  Node.swift
//  AStarSearch
//
//  Created by Kamil Góralski on 16/02/2020.
//  Copyright © 2020 Kamil Góralski. All rights reserved.
//

import Foundation

final public class Node: Codable {

    let row: Int
    let column: Int
    var finalCost: Double {
        gCost + heuristicCost
    }
    private(set) var gCost: Double = 0
    private(set) var heuristicCost: Double = 0
    private(set) var parent: Node?

    public init(row: Int, column: Int) {

        self.row = row
        self.column = column
    }

    func setParent(_ node: Node) {

        self.parent = node
        self.gCost = gIncludingNewCost(node)
    }

    func setHeuristicCost(finishNode: Node) {
        self.heuristicCost = sqrt(pow((Double(row - finishNode.row)), 2) + pow((Double(column - finishNode.column)), 2))
    }

    func isLessCost(from node: Node) -> Bool {
        return gIncludingNewCost(node) < gCost
    }

    private func gIncludingNewCost(_ node: Node) -> Double {
        return node.gCost + 1
    }
}

extension Node: Hashable {

    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.row == rhs.row && lhs.column == rhs.column
    }

    public func hash(into hasher: inout Hasher) {

        hasher.combine(row)
        hasher.combine(column)
    }
}

extension Node: CustomStringConvertible {

    public var description: String {
        return "(\(row), \(column))"
    }
}
