import Foundation


// 1: 빵, 2: 야채, 3:고기
// 1-2-3-1 순서로 와야만 햄버거 제작가능
func solution(_ ingredient:[Int]) -> Int {
    var result = 0
//    var hamberger = [Int]()
    var aaa: Array<Int>?
    var hamberger = ""
    
    if aaa == [1,2,3] {
        print("Aaa")
    }
    
    for i in ingredient {
//        hamberger.append(i)
        hamberger += "\(i)"
        print("before if ",hamberger)
        print("suffix",hamberger.suffix(4))
        if hamberger.suffix(4) == "1231" {
//            hamberger.removeLast(4)
//            hamberger.dropLast(4)
            
            //
//            hamberger.popLast()
//            hamberger.popLast()
//            hamberger.popLast()
//            hamberger.popLast()
//            hamberger.removeSubrange(hamberger.count-4..<hamberger.count)
            result += 1
        }
        print("after if ",hamberger)
        print("=========")
    }
    print(result)
    
    return result
}

solution([2, 1, 1, 2, 3, 1, 2, 3, 1] ) // 2
solution([1, 3, 2, 1, 2, 1, 3, 1, 2] ) // 0
