import Foundation


var N = 5 // 마을 개수
// (a,b,c)
// a, b(1 ≤ a, b ≤ N, a != b)는 도로가 연결하는 두 마을의 번호
// c(1 ≤ c ≤ 10,000, c는 자연수)는 도로를 지나는데 걸리는 시간입니다.
var road = [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]]

var K = 3 // 해당 시간 이하로 배달 가능한 마을에서만 주문

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var result = [Int:[Int:Int]]()
    
    var tempDict = [Int:Int]()
    
//    for i in road {
//        print(i)
//    }
    
    for i in 1...N {
        result[i] = [:]
    }
    
    for i in road {
        print(i)
        result[i[0]]?[i[1]] = i[2]
    }
    
    print(tempDict)
    print(result)

    return 0
}

solution(N, road, K)


struct NodePriority: Comparable {
    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        lhs.priority > rhs.priority
    }
    var node: String = ""
    var priority: Int = 0
}


func dijkstra(graph: [String: [String: Int]], start: String) ->  [String: Int] {
    var distances: [String: Int] = [:]
    var priorityQueue = MaxHeap(NodePriority.init(node: start, priority: 0))
    
    for key in graph.keys {
        let value = key == start ? 0 : 2147483647
        distances.updateValue(value, forKey: key)
    }
    
    while !priorityQueue.isEmpty() {
        guard let popped = priorityQueue.pop() else { break }
        
        if distances[popped.node]! < popped.priority {
            continue
        }
        
        for (node, priority) in graph[popped.node]! {
            let distance = priority + popped.priority
            if distance < distances[node]! {
                distances[node] = distance
                priorityQueue.insert(NodePriority.init(node: node, priority: distance))
            }
        }
    }
    return distances
}
