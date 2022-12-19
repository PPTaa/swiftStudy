import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result: [Int] = [Int]()
    let half = brown / 2
    
    if half == 4 {
        result = [3,3]
    } else {
        for i in 1 ..< (half - 2) {
            print(i, half - i)
            let horizon = half-i
            let vertical = i
            print(vertical * (horizon-2))
            if vertical * (horizon-2) == yellow {
                result = [horizon , vertical+2]
                break
            }
        }
    }
    return result
}

solution(10, 2)
solution(8, 1)
solution(24, 24)
