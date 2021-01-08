import UIKit

var str = "Hello, playground"

let value = Int.random(in: 1...10)
print(value)

print("test")

// 튜플 기본 표현
let coordinates = (4,6)

let x = coordinates.0
let y = coordinates.1

// 튜플 명시적 표현
let coordinatesNamed = (x:5, y:6)

let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

// 튜플 한꺼번에 가져오기
let (x3, y3) = coordinatesNamed
x3
y3


// Boolean 기본 표현
let yes = true
let no = false

// Boolean 활용 (명제에 대해서 참과 거짓 판별-> 코드의 흐름제어)
let isFourGreaterThanFive = 4>5

let a = 5
let b = 10

if a > b {
    print("a가 크다") // 조건이 참인경우
} else{
    print("b가 크다") // 그렇지 않은 경우
}

let name1 = "Tom"
let name2 = "Jam"

if name1 == name2 {
    print("name is same")
} else {
    print("name is not same")
}

// 논리 연산자
let isTom = name1 == "Tom"
let isMale = true
let isFemale = false

let tomAndMale = isTom && isMale // 둘다 true 여야 true
let tomAndFemale = isTom && isFemale
let tomOrMale = isTom || isMale // 둘중 하나만 true 여도 true
let tomOrFemale = isTom || isFemale

//let message:String
//if isTom {
//    message = "Hello Tom"
//} else {
//    message = "Hello Someone"
//}
//
//print("msg: \(message)")

// 삼항 연산자
let message:String = isTom ? "Hello Tom" : "Hello Someone"
print("msg : \(message)")


// Scope (코드의 블럭 범위, 괄호 등으로 표현)
func hello(){
    
    var hour = 50
    let payPerHour = 100000
    var salary = 0

    if hour > 40 {
        let extraHours = hour - 40
        salary += extraHours * payPerHour * 2
        hour -= extraHours
    }
    salary += hour*payPerHour
    print(hour)
}
hello()
