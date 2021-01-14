import UIKit

// Structure : 관계가 있는 것들을 묶어서 표션
// Object = Data + Method
// Structure(Value Types, stack, copy,원본이 변화 x) Vs Class(Reference Types, heap, reference, 원본이 변화함)

// 문제 나에게서 가장 가짜운 편의점 찾기
let store1 = (x:3, y:5, name:"gs")
let store2 = (x:4, y:6, name:"seven")
let store3 = (x:1, y:7, name:"cu")

// 거리구하는 함수
func distance(current: (x:Int, y:Int), target:(x:Int, y:Int)) -> Double {
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}

// 가장 가까운 스토어를 구해서 프린트 하는 함수
func printCloseStore(currentLoaction:(x:Int, y:Int), stores:[(x:Int, y:Int, name: String)]) {
    var closeStoreName = ""
    var closeStoreDistance = Double.infinity
    
    for store in stores{
        let distanceToStore = distance(current: currentLoaction, target: (x: store.x, y: store.y))
        closeStoreDistance = min(distanceToStore, closeStoreDistance)
        if closeStoreDistance == distanceToStore{
            closeStoreName = store.name
        }
    }
    print("Closest Store: \(closeStoreName), distance: \(closeStoreDistance)")
}

// Stores Array 세팅, 현재 내 위치 세팅
let myLocation = (x:1, y:7)
let stores = [store1,store2, store3]

//printCloseStore 함수 이용해서 현재 가장 가까운 스토어 출력
printCloseStore(currentLoaction: myLocation, stores: stores)

// 코드 리팩토링 Struct로 (관계가 있는 데이터를 묶어서 사용할 수 있음)
struct Location {
    let x: Int
    let y: Int
}

struct Store {
    let loc: Location
    let name: String
    let deliveryRange = 2.0
    
    func isDeliverable(userLoc: Location) -> Bool {
        let distanceToStore = distanceRe(current: userLoc, target: loc)
        return distanceToStore < deliveryRange
    }
}

let store4 = Store(loc: Location(x: 8, y: 7), name: "homeplus")
let store5 = Store(loc: Location(x: 2, y: 5), name: "emart")
let store6 = Store(loc: Location(x: 1, y: 9), name: "ministop")


func distanceRe(current: Location, target:Location) -> Double {
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}

func printCloseStoreRe(currentLoaction:Location, stores:[Store] ){
    var closeStoreName = ""
    var closeStoreDistance = Double.infinity
    var isDeliverable = false
    
    for store in stores{
        let distanceToStore = distanceRe(current: currentLoaction, target: store.loc)
        closeStoreDistance = min(distanceToStore, closeStoreDistance)
        if closeStoreDistance == distanceToStore{
            closeStoreName = store.name
            isDeliverable = store.isDeliverable(userLoc: currentLoaction)
        }
    }
    print("Closest Store: \(closeStoreName), distance: \(closeStoreDistance), isDeliverable: \(isDeliverable)")
}

let myLocationRe = Location(x:3,y:4)
let storesRe = [store4,store5,store6]

printCloseStoreRe(currentLoaction: myLocationRe, stores: storesRe)


// Struct 수행과제
// 1. 강의이름, rkdtk이름, 학생수를 가지는 struct만들기 (Lecture)
struct Lecture {
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
