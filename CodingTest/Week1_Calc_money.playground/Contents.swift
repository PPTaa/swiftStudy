import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    var cost = 0
    for i in 1...count {
        cost += i * price
    }
    
//    print(cost)
    if money - cost > 0 {
        return 0
    } else {
        return Int64(cost - money)
    }
}

solution(3, 20, 4)
