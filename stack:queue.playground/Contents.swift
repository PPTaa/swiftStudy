import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var count = progresses.count
    var time = [Int]()
    var result = [Int]()
    if count == 1 {
        result.append(1)
    }
    for i in 0 ..< count {
        let number = Int(ceil(Double(100 - progresses[i]) / Double(speeds[i])))
        time.append(number)
    }
    
    var startPosition = 0
    var nowPosition = 0
    for i in 1 ..< count {
        nowPosition = i
        if time[startPosition] < time[nowPosition] {
            result.append(nowPosition - startPosition)
            startPosition = nowPosition
        }
        
        if i == count-1 {
            result.append(nowPosition - startPosition + 1)
        }
    }
    print(time)
    print(result)
    return result
}

solution([93, 30, 55], [1, 30, 5])
solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1])
solution([95, 90, 99, 99, 80, 99], [4, 1, 1, 1, 1, 1])
