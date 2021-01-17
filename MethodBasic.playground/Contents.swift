import UIKit

// Property : 호출시 (지정된)값을 하나 반환한다
// vs
// Method : 호출시 어떤 작업을 한다

// setter가 필요한가? O -> Computed Property
//                 X -> | 계산이 많이 필요한가?              | O -> Method
//                      | DB access나 File io 가 필요한가? | X -> Computed Property

// ----- Method
struct Lecture {
    var title: String
    var maxStudent: Int = 10
    var numOfRegistered: Int = 0
    
    
    func remainSeats() -> Int{
        let remainSeats = maxStudent - numOfRegistered
        return remainSeats
    }
    
    mutating func register() {
        // 등록된 학생수 증가시키기 스트럭트내의 스토어드 프로퍼티를 변경시킬때 mutating을 사용
        numOfRegistered += 1
    }
    
    static let target: String = "Anybody want to learn Something"
//    type method
    static func 소속학원이름() -> String {
        return "fast Campus"
    }
    
}



var lec = Lecture(title: "ios")

//func remainSeats(of lec: Lecture) -> Int{
//    let remainSeats = lec.maxStudent - lec.numOfRegistered
//    return remainSeats
//}

//remainSeats(of: lec)
//print(remainSeats(of: lec))

lec.remainSeats()

lec.register()
lec.register()
lec.register()
lec.register()
lec.register()

lec.remainSeats()
Lecture.target
Lecture.소속학원이름()

struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -123)
Math.abs(value: 0)
// 제곱, 반값 만드는 함수 추가
extension Math {
    
    static func square(value: Int) -> Int {
        return value * value
    }
    static func half(value: Int) -> Int {
        return value / 2
    }
}
Math.half(value: 10)
Math.square(value: 10)

// 다른사람의 스트럭트를 쉽게 수정해서 확장시킬 수 있음
var value: Int = 3

extension Int {
    func square() -> Int {
        return self * self
    }
    func half() -> Float {
        return Float(self) / 2
    }
}

value.half()
value.square()
