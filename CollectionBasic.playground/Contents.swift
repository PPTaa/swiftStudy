import UIKit

// ----- Array : 객체들을 담아 놓는 통 (같은 타입의 객체들만 담을 수 있음, 순서가 있음)
// 사용 용도 -> 순서가 있는 아이템, 아이템의 순서를 알면 유용할 때

let evenNumbers: [Int] = [2,4,6,8]
var evenNumbers1: [Int] = [2,4,6,8]
let evenNumbers2: Array<Int> = [2,4,6,8]

evenNumbers1.append(10)
evenNumbers1 += [12,14,16]
evenNumbers1.append(contentsOf: [18,20,22])

let isEmpty = evenNumbers1.isEmpty // 비어있는지 확인
evenNumbers1.count // array 갯수 확인
print(evenNumbers1.first)
//evenNumbers1=[]
let firstItem = evenNumbers1.first

if let firstElement = evenNumbers1.last {
    print(firstElement)
}

evenNumbers1.min()
evenNumbers1.max()

evenNumbers1[0]
evenNumbers1[1]
evenNumbers1[2]
evenNumbers1[10]

// -----

let firstToThree = evenNumbers1[1...3]
evenNumbers1.contains(3)
evenNumbers1.contains(4)

evenNumbers1.insert(0, at: 0) // 특정인덱스에 새로운 값 삽입
evenNumbers1.remove(at: 0) // 특정인덱스 값 삭제
//evenNumbers1.removeAll()// 전체삭제
evenNumbers1[1] = -2 // update
evenNumbers1
evenNumbers1[0...2] = [-2,0,2] // range update
evenNumbers1

evenNumbers1.swapAt(0, 10) // 인덱스 번호로 스왑
evenNumbers1

for num in evenNumbers1 {
    print(num)
}
//enumerate
for (idx, value) in evenNumbers1.enumerated() {
    print(idx, value)
}

// 앞의 세개만 없애고 나머지를 리턴
evenNumbers1.dropFirst(3)
// 뒤의 네개만 없애고 나머지를 리턴
evenNumbers1.dropLast(4)
// 앞의 3개 만 가져옴
evenNumbers1.prefix(3)
// 뒤에 3개만 가져옴
evenNumbers1.suffix(3)

// 원래는 그대로
evenNumbers1


// ----- Dictionary: key와 value 값으로 표현

var scoreDict: [String: Int] = ["Tom":99, "Json":80, "Mary":77]
var scoreDict1: Dictionary<String, Int> = ["Tom":99, "Json":80, "Mary":77]

scoreDict["Tom"]
scoreDict["jj"] // 없을 수도 있기 때문에 optional

//scoreDict = [:]
scoreDict.isEmpty // 비어있는지
scoreDict.count // 갯수

// 기존 key 업데이트
scoreDict["Json"] = 100
scoreDict

// key, value 추가
scoreDict["Jack"] = 74
scoreDict

// 삭제
scoreDict["Jack"] = nil
scoreDict

//for loop
// key, value 모두 가져오는 것
for (name, score) in scoreDict {
    print(name, score)
}

// key만 가져오는 것
for key in scoreDict.keys {
    print(key) // 순서는 없음
}

// 1. 이름, 직업, 도시에 대해서 본인의 딕셔너리 만들기
var me:[String: String] = ["Name":"Lee", "Job":"Dev", "City":"Seoul"]
// 2. 여기서 도시를 부산으로 업데이트 하기
me["City"] = "Busan"
// 3. 딕셔너리를 받아서 이름과 도시 프린트하는 함수 만들기
func printDict(dic:Dictionary<String, String>) {
    guard let name = dic["Name"] else { return print("nil") }
    guard let city = dic["City"] else { return print("nil") }
    print("name: \(name)")
    print("city: \(city)")
}

printDict(dic: me)

// ----- Set : 중복이 없는 유니크한 아이템을 관리 할때 , 순서가 없음

var someSet: Set<Int> = [1,2,3,4,5,1,2,4,5,6]

someSet.isEmpty
someSet.count

someSet.contains(4)
someSet.contains(8)

someSet.insert(10)
someSet.remove(1)
someSet
