import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var result = 0
    var balance = 0
    var trees = [Int: [Int]]()
    var info_count = info.count
    // 999 : 안 지나감
    // 888 : 지나감
    for i in 0 ..< info_count {
        trees[i] = [999]
    }
    
    for i in edges {
        trees[i[0]]!.append(i[1])
    }
    for (node, end) in trees {
        for i in end {
            if i == 999 { continue }
            trees[i]!.append(node)
        }
    }

    let tree_sorted = trees.sorted { $0.0 < $1.0 }
    for (k,v) in tree_sorted {
        print(k, v)
    }
    
    while balance == 0 {
    }
    
    return 0
}

var info = [0,0,1,1,1,0,1,0,1,0,1,1]
var edges = [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]]

solution(info, edges)

info = [0,1,0,1,1,0,1,0,0,1,0]
edges = [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6],[3,7],[4,8],[6,9],[9,10]]
solution(info, edges)

