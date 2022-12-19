import Foundation

func solution(_ n:Int) -> Int {
    var answer:Int = 0
    let n = String(n)
    
    let test = Array(n)
    
//    print(n.count)
    
    for i in 0 ..< n.count {
        let num:String = String(n[n.index(n.startIndex, offsetBy: i)])
        print(Int(num)!)
        answer += Int(num)!
    }
    
    // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    print("Hello Swift")
    
    return answer
}

//solution(123)
//solution(987)
//solution(123456)

func solution(_ s:String) -> String {
    
    let length = s.count
    let half: Int = length/2
    var answer: String = ""
    let frontOfHalfIdx = s.index(s.startIndex, offsetBy: half-1)
    let halfIdx = s.index(s.startIndex, offsetBy: half)
    
    if length % 2 == 0 {
        answer += String(s[frontOfHalfIdx...halfIdx])
    } else {
        answer += String(s[halfIdx])
    }
    
    return answer
}
solution("ksjfah")
