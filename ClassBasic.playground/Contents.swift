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

