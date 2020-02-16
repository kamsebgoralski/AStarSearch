//
//  AStar.swift
//  AStarSearch
//
//  Created by Kamil Góralski on 16/02/2020.
//  Copyright © 2020 Kamil Góralski. All rights reserved.
//

public struct AStar {

    private let startNode: Node
    private let finishNode: Node
    private(set) var searchArea: Matrix<Field>
    private var closeNodes = [Node]()
    private var openNodes = Set<Node>()
    private var searchSides: [SearchSide] = [.onBottom, .onLeft, .onTop, .onRight]

    public init?(rows: Int, columns: Int, startNode: Node, finishNode: Node) {

        self.startNode = startNode
        self.finishNode = finishNode
        self.searchArea = Matrix(rows: rows, columns: columns, defaultValue: Field(type: .normal))

        guard searchArea.indexInRange(row: startNode.row, column: startNode.column),
            searchArea.indexInRange(row: finishNode.row, column: finishNode.column) else {
            return nil
        }
    }

    public func setBlockedNodes(nodes: Set<Node>) {

        //TODO first set all nodes to normal type
        //TODO what if the node is out of range??

        for node in nodes {
            searchArea[node.row, node.column].setBlocked()
        }
    }

    mutating public func findPath() -> [Node] {

        openNodes.removeAll()
        closeNodes.removeAll()

        openNodes.insert(startNode)

        while !openNodes.isEmpty {

            let node = openNodes.sorted { $0.finalCost < $1.finalCost }.first!

            closeNodes.append(node)
            openNodes.remove(node)

            guard !isFinishNode(node) else {
                return pathFromStart(to: node)
            }

            insertAdjacentNodesIntoOpenNodes(for: node)
        }

        return []
    }

    private func pathFromStart(to node: Node) -> [Node] {

        guard let parent = node.parent else {
            return [startNode]
        }

        return pathFromStart(to: parent) + [node]
    }

    mutating private func insertAdjacentNodesIntoOpenNodes(for node: Node) {

        for searchSide in searchSides {

            insertAdjacentNodeIntoOpenNodes(for: node, searchSide: searchSide)
        }
    }

    mutating private func insertAdjacentNodeIntoOpenNodes(for node: Node, searchSide: SearchSide) {

        let adjacentNode = Node(row: node.row + searchSide.verticalFactor, column: node.column + searchSide.horizontalFactor)

        guard inRange(adjacentNode),
            !isBlocked(adjacentNode),
            !closeNodes.contains(adjacentNode) else {

            return
        }

        if let openNode = openNodes.first(where: { $0 == adjacentNode }) {

            if openNode.isLessCost(from: node) {
                openNode.setParent(node)
            }

        } else {

            adjacentNode.setParent(node)
            adjacentNode.setHeuristicCost(finishNode: finishNode)
            openNodes.insert(adjacentNode)
        }
    }

    private func isFinishNode(_ node: Node) -> Bool {
        return finishNode == node
    }

    private func inRange(_ node: Node) -> Bool {
        return searchArea.indexInRange(row: node.row, column: node.column)
    }

    private func isBlocked(_ node: Node) -> Bool {
        return searchArea[node.row, node.column].type == .blocked
    }
}

extension AStar {

    enum SearchSide {

        case onBottom
        case onLeft
        case onTop
        case onRight

        var verticalFactor: Int {

            switch self {
            case .onBottom:
                return -1
            case .onLeft:
                return 0
            case .onTop:
                return 1
            case .onRight:
                return 0
            }
        }

        var horizontalFactor: Int {

            switch self {
            case .onBottom:
                return 0
            case .onLeft:
                return -1
            case .onTop:
                return 0
            case .onRight:
                return 1
            }
        }
    }
}
