import UIKit

var carName: String?
carName = nil
carName = "hyundai"

// 1. 사람의 이름을 담는 변수를 작성(타입 String Optional)
var person: String? = "parkboyoung"
person = nil
// 2. let num = Int("10") -> 타입은? : 숫자 옵셔널
let num1 = Int("10")
let num2 = Int("10ㅁㄴㅇㅁㄴㅇ") // 캐스팅이 실패할 경우 nil이 적용

// 고급기능 4가지
print("시작 : \(carName)")
// 1. Forced. unwrapping : 억지로 박스를 까기 -> 값이 없는경우 complie error
// carName =. nil
print("1. \(carName!)")

// 2. Optional binding(if let) : 부드럽게 박스를 까기1
if let unwrappedCarName = carName {
    print("2. \(unwrappedCarName)")
} else {
    print("Car Name 없음")
}

func printParsedInt1(from: String) {
    if let parsedInt = Int(from) {
        print(parsedInt)
    } else {
        print("if let INT로 컨버팅 불가 : \(from)")
    }
}
printParsedInt1(from: "100")
printParsedInt1(from: "Tom")

// 3. Optional binding(guard let) : 부드럽게 박스를 까기2
func printParsedInt2(from: String) {
    guard let parsedInt = Int(from) else { return
        print("guard let INT로 컨버팅 불가 : \(from)")

    }
    print(parsedInt)
}
printParsedInt2(from: "85")
printParsedInt2(from: "guard let")

// 4. Nil coalescing : 박스를 까봣더니, 값이 없으면 디폴트 값을 주는 것
carName = nil
let myCarName:String = carName ?? "KIA"
print(myCarName)

// 1. 음식이름을 담는 변수를 작성(옵셔널)
var myFood:String? = "Chicken"
//myFood = nil
// 2. 옵셔널 바인딩을 이용해서 값을 확인해보기
if let food = myFood {
    print("if let ---> \(food)")
} else {
    print("if let ---> nil")
}

// 3. 닉네입을 받아서 출력하는 함수 만들기, 조건 입력 파라미터는 String?
func printNickName(_ nickname : String?) {
    guard let name = nickname else { return
        print("nil")
    }
    print("nickname is \(name)")
}
printNickName(nil)
printNickName("TOMSOM")
