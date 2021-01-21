import UIKit
//
// 기존의 코드
//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName(){
//        print("My Name is \(firstName) \(lastName)")
//    }
//}
//
//// Person을 상속
//class Student: Person {
//    var grades: [Grade] = []
//}
//
//// 학생인데 운동선수
//class StudentAthelete: Student{
//    var minimumTrainingTime: Int = 2
//    var trainedTime: Int = 0
//
//    func train(){
//        trainedTime += 1
//    }
//}
//
//// 운동선수인데 축구선수
//class FootballPlayer:StudentAthelete {
//    var footballTeam = "FC Swift"
//
//    override func train() {
//        trainedTime += 2
//    }
//}
//

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName(){
        print("My Name is \(firstName) \(lastName)")
    }
}

// Person을 상속
class Student: Person {
    var grades: [Grade] = []
    override init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(student:Student) {
        self.init(firstName: student.firstName, lastName: student.lastName)
    }
}

// 학생인데 운동선수
class StudentAthelete: Student{
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports:[String]
    
    init(firstName: String, lastName:String, sports: [String]) {
        // Phase-1
        self.sports = sports
//        self.train() Compile Error
        super.init(firstName: firstName, lastName: lastName)
        
        // Phase-2
        self.train()
    }

    // convenience init : init에 parameter를 간략하게 만듬
    convenience init(name: String) {
        self.init(firstName: name , lastName: "", sports:[])
    }
    
    func train(){
        trainedTime += 1
    }
}

// 운동선수인데 축구선수
class FootballPlayer:StudentAthelete {
    var footballTeam = "FC Swift"

    override func train() {
        trainedTime += 2
    }
}

let student1 = Student(firstName: "Tom", lastName: "Lee")
let student2 = StudentAthelete(firstName: "Sam", lastName: "Kim", sports: ["swim"])
let student3 = StudentAthelete(name: "Park")
let student4 = Student(student: student1)


// 2 phase initialization : Class 생성시 두가지 단계를 가짐
// Phase-1 : 모든 property는 init되어야 한다. 자식 -> 부모
// Phase-2 : 부모클래스의 property까지 모두 설정후에 property를 사용할 수 있다.

// designated init : 자신의 부모의 DI를 호출 해야함
// convenience init : 같은 클래스의 init을 꼭하나 호출해야한다. CI는 DI를 호출해야한다.
