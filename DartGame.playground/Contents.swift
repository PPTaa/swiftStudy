func solution(_ dartResult:String) -> Int {
    var answer = [Int]()
    var list = [String]()
    var count = dartResult.count
    var i_list = [Int]()
    
    for i in dartResult {
        list.append(String(i))
    }

    // 0을 찾아 0과 10을 판별
    for i in 0 ..< count {
        if list[i] == "0" {
            if i == 0 {
                list[i] = "0"
            } else if list[i-1] == "1" {
                list[i-1] = "10"
                i_list.append(i)
            }
        }
    }
    
    print("list : \(list)")
    print("i_list : \(i_list)")

    // 0의 위치를 저장하여 제거
    i_list.sort(by: >)
    for i in i_list{
        list.remove(at: i)
    }
    print("+++ : \(list)")
    count = list.count

    // S,D,T에 대한 처리하여 새로운 리스트에 담음
    for i in 0 ..< count {
        if list[i] == "S" {
            answer.append(Int(list[i-1])!)
        }
        if list[i] == "D" {
            answer.append(Int(list[i-1])! * Int(list[i-1])!)
        }
        if list[i] == "T" {
            answer.append(Int(list[i-1])! * Int(list[i-1])! * Int(list[i-1])!)
        }
    }
    print("++++ \(answer)")
    // 스타상, 아차상에 대한 효과처리
    for i in 0 ..< count {
        if list[i] == "*" {
            print("****** \(i)")
            if i <= 2 {
                answer[0] = answer[0] * 2
            } else if i <= 5 {
                answer[0] = answer[0] * 2
                answer[1] = answer[1] * 2
            } else {
                answer[1] = answer[1] * 2
                answer[2] = answer[2] * 2
            }
        }
        if list[i] == "#" {
            print("###### \(i)")
            if i <= 2 {
                answer[0] = answer[0] * -1
            } else if i <= 5 {
                answer[1] = answer[1] * -1
            } else {
                answer[2] = answer[2] * -1
            }
        }
    }
    print(list)
    print("_____+++++ : \(answer)")
    
    var result = 0
    for i in answer {
        result += i
    }
    
    return result
}

//solution("1S2D*3T")
//solution("1D2S#10S")
solution("10S*10T*10S")
//solution("1D2S0T")
//solution("1S*2T*3S")
//solution("1S*2T*3S*")
solution("0S*0T*0S*")

