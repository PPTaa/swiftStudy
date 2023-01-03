//import Foundation
//
//func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
//    var count = discount.count
//    var newWants = [String]()
//    var result = 0
//
//    for i in 0 ..< want.count {
//        for _ in 0 ..< number[i] {
//            newWants.append(want[i])
//        }
//    }
//
//    newWants.sort()
//    print(newWants)
//    print("____")
//    for i in 0 ... count - 10 {
//        print(discount[i..<i+10].sorted())
//        if newWants == discount[i..<i+10].sorted() {
//            result += 1
//        }
//    }
//
//    print("++++++")
//    return result
//}
//
//solution(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]) // 3
//
//solution(["apple"], [10], ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]) // 0


func solution2(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    let count = want.count
    var result = 0
    
    var wantsIdxDict = [String: Int]()
    var discountNumber = [Int](repeating: 0, count: count)
    
    
    for i in 0 ..< count {
        wantsIdxDict[want[i]] = i
    }

    print(wantsIdxDict)
    for i in 0...9 {
        guard let wantIdx = wantsIdxDict[discount[i]] else { continue }
        discountNumber[wantIdx] += 1
    }
    print(number, discountNumber, separator: "vs")
    
    if number == discountNumber {
        result += 1
    }
    
    for i in 0 ..< discount.count-10 {
        if let wantIdx = wantsIdxDict[discount[i]] {
            discountNumber[wantIdx] -= 1
        }
        
        if let wantIdx = wantsIdxDict[discount[i+10]] {
            discountNumber[wantIdx] += 1
        }
        print(number, discountNumber, separator: "vs")
        
        if number == discountNumber {
            result += 1
        }
    }
    
    return result
}
solution2(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]) // 3

solution2(["apple"], [10], ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]) // 0
