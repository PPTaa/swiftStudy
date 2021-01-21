import UIKit

// struct : 복사하여 생성한 것 (stack)
// stack : 효율적이고 빠름

// class : 참조하고 있는 것 (heap)
// heap : 큰 메모리 풀 , 스택보다는 느리다.

struct PersonStruct {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    mutating func uppercaseName(){
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

class PersonClass {
    var firstName: String
    var lastName: String
    
    init(firstName:String, lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func uppercaseName(){
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}
var personStruct1 = PersonStruct(firstName: "Tom", lastName: "Kim")
var personStruct2 = personStruct1

var personClass1 = PersonClass(firstName: "Tom", lastName: "Kim")
var personClass2 = personClass1

personStruct2.firstName = "Jay"
personStruct1.firstName
personStruct2.firstName

personClass2.firstName = "Jay"
personClass1.firstName
personClass2.firstName

personClass2 = PersonClass(firstName: "John", lastName: "Doe")
personClass1.firstName
personClass2.firstName

personClass1 = personClass2
personClass1.firstName
personClass2.firstName

// struct 사용하는 경우
// 1. 두 object를 같다 다르다로 비교해야하는 경우 ex)
//let point1 = Point(x:3, y:5)
//let point2 = Point(x:3, y:5)

// 2. Copy된 각 객체들이 독립적인 상태를 가져야 하는 경우
//var myMac = Mac(owner:"Tom")
//var yourMac = myMac
//yourMac.owner = "Kim"
//myMac.owner
//yourMac.owner

// 3. 코드에서 오브젝트의 데이터를 여러 스레드에 걸쳐 사용할 경우


// class 사용하는 경우
// 1. 두 object의 인스턴스자체가 같음을 확인해야 하는 경우

// 2. 하나의 객체가 필요하고, 여러대상에 의해 접근되고 변경이 필요한 경우

// -----> 일단 Struct로 쓰고 Clas를 활용해야 하는 경우 변환시키자
