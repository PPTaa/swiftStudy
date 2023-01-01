import Foundation
// 토핑을 공평하게 나누는 방법
func solution(_ topping:[Int]) -> Int {
    var result = 0
    for i in 0 ..< (topping.count - 1) {
        print(topping[0...i], topping[i+1..<topping.count], separator: ",,")
        let firstTopping: Set<Int> = Set(topping[0...i])
        let lastTopping: Set<Int> = Set(topping[i+1..<topping.count])
        print(firstTopping, lastTopping, separator: "vs")
        print("=======")
        if firstTopping.count == lastTopping.count {
            result += 1
        }
    }
    return result
}
//
//solution([1, 2, 1, 3, 1, 4, 1, 2] )
//solution([1, 2, 3, 1, 4]    )

// 토핑을 공평하게 나누는 방법
func solution2(_ topping:[Int]) -> Int {
    var result = 0
    let count = topping.count
    var leftCake = Array(repeating: 0, count: count)
    var rightCake = Array(repeating: 0, count: count)
    var setCake: Set<Int> = Set()
    for i in 0 ..< count-1 {
        print(i)
        setCake.insert(topping[i])
        leftCake[i] = setCake.count
    }
    setCake.removeAll()
    print("======")
    for i in (1 ..< count).reversed() {
        print(i)
        setCake.insert(topping[i])
        rightCake[i-1] = setCake.count
    }
    
    print(leftCake, rightCake, separator: "\n")
    for i in 0 ..< count-1 {
        if leftCake[i] == rightCake[i] {
            result += 1
        }
    }
    return result
}

solution2([1, 2, 1, 3, 1, 4, 1, 2] )
solution2([1, 2, 3, 1, 4]    )
