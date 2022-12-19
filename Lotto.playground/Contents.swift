import Foundation
func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    var good: Int = 0
    var bad: Int = 0
    let rank: Array<Int> = [6,6,5,4,3,2,1]
    
    for i in lottos {
        if i == 0 {
            good += 1
        } else {
            if win_nums.contains(i) {
                good += 1
                bad += 1
            }
        }
    }
    print(good, bad)
//    if bad == 0 {
//        bad = 1
//    }
//    if good == 0 {
//        good = 1
//    }
    print("good \(rank[good])")
    print("bad \(rank[bad])")
    
    return [rank[good], rank[bad]]
}

solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19])
solution([45, 4, 35, 20, 3, 9], [31, 10, 45, 1, 6, 19])
solution([0, 0, 0, 0, 0, 0], [31, 10, 45, 1, 6, 19])
solution([0, 1, 2, 3, 4, 5], [31, 10, 45, 9, 6, 19])
