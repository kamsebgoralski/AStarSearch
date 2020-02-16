//
//  Field.swift
//  AStarSearch
//
//  Created by Kamil Góralski on 16/02/2020.
//  Copyright © 2020 Kamil Góralski. All rights reserved.
//

struct Field {

    private(set) var type: Type

    init(type: Type) {
        self.type = type
    }

    mutating func setBlocked() {
        type = .blocked
    }
}

extension Field {

    enum `Type` {
        case normal
        case blocked
    }
}
