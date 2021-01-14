import UIKit

var str = "Hello, playground"

// 프로로콜 : 서비스를 이용할때 해야할 일들의 목록 (규약)

// CustomStringConvertible (객체를 불러올 때 설명을 커스텀 할 수 있음)
struct Lecture: CustomStringConvertible {
    var description: String {
        return "use CustomStringConvertible title: \(lectureName), professor: \(professorName), studentCount: \(studentCnt)"
    }
    
    let lectureName: String
    let professorName: String
    let studentCnt: Int
}
// 2. 강의 어레이이와 강사이름을 받아서, 해당 간사의 강의이름을 출력하는 함수 만들기
func printLecture(from profName:String, lectures:[Lecture]){
//    var lecName: String = ""
//
//    for lecture in lectures {
//        if profName == lecture.professorName {
//            lecName = lecture.lectureName
//        } else {
//            lecName = "없어요"
//        }
//    }
    
//    클로저 이용
    let lecName = lectures.first { (lec) -> Bool in
        return lec.professorName == profName
    }?.lectureName ?? "없어용"
    
    print("강사님의 강의는 : \(lecName)")
}

// 3. 강의 3개 만들고 강사이름으로 강의 찾기
let lec1 = Lecture(lectureName: "math", professorName: "tom", studentCnt: 10)
let lec2 = Lecture(lectureName: "Com", professorName: "kim", studentCnt: 5)
let lec3 = Lecture(lectureName: "Kor", professorName: "john", studentCnt: 19)
let lectures = [lec1,lec2,lec3]

printLecture(from: "kim", lectures: lectures)

print(lec1)
print(lec2)
print(lec3)
