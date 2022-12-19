func solution(_ num:Int) -> Int {
    var result = num
    var count = 0
    print(result)
    while result != 1 {
        count += 1
        if result % 2 == 0 {
            result /= 2
        } else {
            result = result * 3 + 1
        }
        if count >= 500 {
            return -1
        }
    }
    return count
}

solution(6)
solution(16)
solution(626331)
