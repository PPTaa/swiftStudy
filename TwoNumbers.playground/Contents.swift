import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result:[Int] = []
    var numbers_count = numbers.count
    for i in 0...numbers_count-2{
        print("i ___ \(i)")
        for j in i+1...numbers_count-1 {
            print("j ___ \(j)")
            result.append(numbers[i]+numbers[j])
        }
    }
    result = Array(Set(result))
    result.sort()
    print(result)
//    print(Set(result))
    return result
}

solution([2,1,3,4,1])
solution([5,0,2,7])
