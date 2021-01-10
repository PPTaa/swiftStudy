import UIKit // UI관련 컴포넌트
import Foundation

// ------ while & repeat
//while condition {
//    <#code#>
//}

//var i = 0
//while i < 10 {
//    print(i)
//    i += 1
//}
print("while") // 조건 검사후 코드 수행
var i = 0
while i < 10 {
    print(i)
    if i == 5 {
        break
    }
    i += 1
}

print("repeat") // 코드 수행 후 조건 검사
i = 0
repeat {
    print(i)
    i += 1
} while i < 10

// ------ for loop

let closedRange = 0...10
let halfClosedRange = 0..<10

var sum = 0
for i in closedRange {
    print("--->\(i)")
    sum += i
}
print("---> total sum : \(sum)")

sum = 0
for i in halfClosedRange {
    print("--->\(i)")
    sum += i
}
print("---> total sum : \(sum)")

// sin 그래프
var sinValue: CGFloat = 0
for i in closedRange {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

let name = "Tom"
for _ in closedRange {
    print("name : \(name)")
}
// 짝수만 출력
for i in closedRange {
    if i % 2 == 0 {
        print("짝수 : \(i)")
    }
}
// where 구문을 만족할 때만 for 문을 실행
for i in closedRange where i % 2 == 0 {
    print("짝수 where : \(i)")
}
// continue
for i in closedRange {
    if i == 3{
        continue
    }
    print("continue 3 : \(i)")
}

for i in closedRange {
    for j in closedRange {
        print("구구단 : \(i) * \(j) = \(i*j)")
    }
}

// switch
let num = 10
switch num { // switch 는 순서가 중요
case 0:
    print("this is 0")
case 0...10:
    print("0~10 사이 입니다. ")
case 10:
    print("this is 10")
default: // 모든 케이스를 커버하지 못하면 default가 필요함
    print("나머지")
}

let animal = "fish"
switch animal {
case "bird", "cat":
    print("걸어 다닙니다.")
default:
    print("걷지 못합니다.")
}

let num1 = 30
switch num1 {
case _ where num1 % 2 == 0:
    print("짝수")
default:
    print("홀수")
}

//let coordinate =  (x:10, y: 10)
//switch coordinate {
//case (0,0):
//    print("원접 입니다")
//case (_,0):
//    print("x축 입니다")
//case (0,_):
//    print("y축 입니다")
//default:
//    print("좌표 어딘가")
//}

let coordinate =  (x:10, y: 10)
switch coordinate {
case (0,0):
    print("원접 입니다")
case (let x,0):
    print("x축 입니다 \(x)")
case (0,let y):
    print("y축 입니다 \(y)")
case (let x, let y) where x == y:
    print("x와 y가 같음 \(x),\(y)")
case (let x, let y):
    print("좌표 어딘가 \(x),\(y)")
}
