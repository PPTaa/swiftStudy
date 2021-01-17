import UIKit

// 프로퍼티
struct Person {
    // instance property
    // stored property (저장된 프로퍼티) : 객체안에 값들을 저장하는 프로퍼티
    var firstName : String {
        // 프로퍼티가 변화할 때를 관찰 할 수 있음
        willSet { // 값이 변화하기 전
            print("willset\(firstName) -> \(newValue)")
        }
        didSet { // 값이 변화한 후
            print("didset\(oldValue) -> \(firstName)")
        }
    }
    
    var lastName : String
    
    // lazy property : 프로퍼티를 호출할 때 생성되는 프로퍼티 -> 리소스 자원을 적게 먹기 위함
    lazy var isPopular: Bool = {
        if fullName == "Jay Park" {
            return true
        } else {
            return false
        }
    }()
    
    // computed property (계산된 프로퍼티) : 가공시키는 프로퍼티
    var fullName:String {
        get{
            return "\(firstName) \(lastName)"
        }
        set{
            // new value setter
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    // type property : 생성된 인스턴스와 상관없이 타입의 속성 지정하고 싶을때 사용
    static let isAlien: Bool = false
}

var person = Person(firstName: "Tom", lastName: "Lee")

person.firstName
person.lastName

person.firstName = "John"
person.lastName = "Kim"

person.firstName
person.lastName

person.isPopular

person.fullName
person.fullName = "Jay Park"

person.firstName
person.lastName

Person.isAlien

person.isPopular

// Property : 호출시 (지정된)값을 하나 반환한다
// vs
// Method : 호출시 어떤 작업을 한다

// setter가 필요한가? O -> Computed Property
//                 X -> | 계산이 많이 필요한가?              | O -> Method
//                      | DB access나 File io 가 필요한가? | X -> Computed Property

// Method
