//
//  Matrix.swift
//  AStarSearch
//
//  Created by Kamil Góralski on 16/02/2020.
//  Copyright © 2020 Kamil Góralski. All rights reserved.
//

final class Matrix<T> {

    private let rows: Int
    private let columns: Int
    private(set) var grid: [T]

    init(rows: Int, columns: Int, defaultValue: T) {

        self.rows = rows
        self.columns = columns
        self.grid = Array(repeating: defaultValue, count: rows * columns)
    }

    func indexInRange(row: Int, column: Int) -> Bool {
        return row < rows && row >= 0 && column < columns && column >= 0
    }

    subscript(row: Int, column: Int) -> T {
        get {
            assert(indexInRange(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexInRange(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
