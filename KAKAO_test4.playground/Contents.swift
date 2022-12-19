import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    let score = [10,9,8,7,6,5,4,3,2,1,0]
    var result = [Int]()
    if n == 1 {
        if info != [1,0,0,0,0,0,0,0,0,0,0] {
            result = [-1]
        }
        result = [1,0,0,0,0,0,0,0,0,0,0]
    }
    
    return result
}

var n = 5
// [10]
var info = [2,1,1,1,0,0,0,0,0,0,0]
solution(n, info)
