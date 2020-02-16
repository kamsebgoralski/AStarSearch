# AStarSearch

## Description
AStarSearch is a simple algorithm to search for the optimal path between start and end point in the matrix

## Installation

### Installing with CocoaPods

If you are using CocoaPods add this text to your Podfile and run `pod install`.

```bash
platform :ios, '8.0'
use_frameworks!

pod 'AStarSearch'
```

### Installing with Carthage

Alternatively, add `github "kamsebgoralski/AStarSearch"` to your Cartfile and run `carthage update`.

### Installing with Swift Package Manager

In Xcode 11+ select File > Swift Packages > Add Package Dependency....
Enter this project's URL: https://github.com/kamsebgoralski/AStarSearch

## Usage

Add `import AStarSearch` to your source code and use

```Swift

let startNode = Node(row: 3, column: 1)
let finishNode = Node(row: 4, column: 5)

var aStar = AStar(rows: 6, columns: 6, startNode: startNode, finishNode: finishNode)
aStar?.setBlockedNodes(nodes:
    [Node(row: 4, column: 1), Node(row: 3, column: 2), Node(row: 2, column: 3), Node(row: 1, column: 4)])

let path = aStar?.findPath()
```

## Feedback

If you notice any issue, got stuck or just want to chat feel free to create an issue. I will be happy to help you.

## License

AStarSearch is released under the [MIT License](LICENSE).
