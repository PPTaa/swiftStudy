import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var count = discount.count
    var newWants = [String]()
    var result = 0
    
    for i in 0 ..< want.count {
        for _ in 0 ..< number[i] {
            newWants.append(want[i])
        }
    }
    
    newWants.sort()
    print(newWants)
    print("____")
    for i in 0 ... count - 10 {
        print(discount[i..<i+10].sorted())
        if newWants == discount[i..<i+10].sorted() {
            result += 1
        }
    }
    
    print("++++++")
    return result
}

solution(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]) // 3

solution(["apple"], [10], ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]) // 0
