import UIKit

// 기존의 코드
//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//struct Person{
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//    func printMyName(){
//        print("My Name is \(firstName) \(lastName)")
//    }
//}
//
//struct Student {
//    var grades: [Grade] = []
//
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//    func printMyName(){
//        print("My Name is \(firstName) \(lastName)")
//    }
//}


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
}

let tom = Person(firstName: "Tom", lastName: "Kim")
let jay = Student(firstName: "Jay", lastName: "Park")

tom.firstName
jay.firstName

tom.printMyName()
jay.printMyName()

let math = Grade(letter: "B", points: 10, credits: 3)
let kor = Grade(letter: "A", points: 15, credits: 2)
jay.grades.append(math)
jay.grades.append(kor)
//tom.grades.append(math)

// 상속? : A is B (A는 B에 포함)
// Person : superClass
// Student : subClass

// 상속의 규칙
// 1. 한개의 superClass만 상속
// 2. 부모는 여러 자식을 가질수 있음
// 3. 상속의 깊이(단계)는 상관이 없음

// 학생인데 운동선수
class StudentAthelete: Student{
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    
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

// 사람 > 학생 > 체육 > 축구선수
var athelete1 = StudentAthelete(firstName: "Yuna", lastName: "Kim")
var athelete2 = FootballPlayer(firstName: "Jisung", lastName: "Park")

athelete1.firstName
athelete2.firstName

athelete1.grades.append(math)
athelete2.grades.append(math)

athelete1.minimumTrainingTime
athelete2.minimumTrainingTime

//athelete1.footballTeam
athelete2.footballTeam

athelete1.train()
athelete1.train()
athelete1.trainedTime

athelete2.train()
athelete2.train()
athelete2.trainedTime

athelete1 = athelete2 as StudentAthelete
athelete1.train()
athelete1.trainedTime


if let jisung = athelete1 as? FootballPlayer {
    print("team --> \(jisung.footballTeam)")
}

// 상속은 언제하는게 좋을까?
// Single Responsibility(단일책임) : 하나의 클래스는 하나의 일만 집중적으로 수행
// Type Safety(타입이 분명해야 할때)
// Shared Base Classes(다자녀가 있다)
// Extensibility(확장성이 필요한 경우) : 학습이라는 클래스 하나로 여러가지를 만듬
// Identity(정체를 파악하기 위해) : 타입을 확인하고 내용을 확인하기 위해
// --> 코드를 짜는데 나만의 철학? 이유? 가 있어야함
