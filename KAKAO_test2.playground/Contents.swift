import Foundation
// 완
func solution(_ n:Int, _ k:Int) -> Int {
    let change =  String(n, radix: k)
    var result = 0
    let a = change.components(separatedBy: "0")
    for i in a {
        if i == "" { continue }
        if (is_prime(numString: i)) {
            result += 1
        }
    }
    return result
}

func is_prime(numString: String) -> Bool {
    
    let num = Int(numString) ?? 0
    
    if num < 4 {
        return num == 1 ? false : true
    }
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 { return false }
    }
    return true
}


var n = 437674
var k = 3
solution(n, k)

n = 110011
k = 10
solution(n, k)
