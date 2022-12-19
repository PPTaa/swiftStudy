import UIKit

var strings = ["sun", "bed", "car"]
var n = 1

func solution(_ strings:[String], _ n:Int) -> [String] {
    

    print(strings, n)
//    var list = [Int: String]()
    let result = [String]()
//
//    for i in strings {
//        var char = i[i.index(i.startIndex, offsetBy: n)]
//        list[alpabet.firstIndex(of: String(char))!] = i
//    }
//
//    for (k,v) in list.sorted(by: {$0.0 < $1.0}) {
//        print("k:\(k), v:\(v)")
//        result.append(v)
//    }
    
//    let num = strings.count
//    for i in 0..<num {
//        strings[i].swapAt
//    }
//    let list = strings.sorted(by: {$0[$0.index($0.startIndex, offsetBy: n)] < $1[$1.index($1.startIndex, offsetBy: n)]})
//    strings.sorted()
    let list = strings.sorted {
        if $0[$0.index($0.startIndex, offsetBy: n)] == $1[$1.index($1.startIndex, offsetBy: n)] {
            return $0 < $1
        } else {
            return $0[$0.index($0.startIndex, offsetBy: n)] < $1[$1.index($1.startIndex, offsetBy: n)]
        }
    }

    print(list)
    
    return result
}

solution(strings, n)



func func4(name: String) -> String{
    print("func4")
    return "func4 \(name) 리턴"
}

func4(name: "Aaa")

var test = func4(name: "Aaa")

print(test)


//func callback(fn: () -> Void){
//    _ = fn
//}

var fff: (() -> Void)!

func callback(fn: @escaping () -> Void) {
    fff = fn
    fff()
}
callback {
  print("콜백함수 실행")
} // 콜백함수 실행

fff()

var arrs1 = [String]()
func addVars1(fn: () -> Void) {
    arrs1 = Array(repeating: "", count: 3)
    fn()
}

addVars1 {
    arrs1.insert("0000", at: 2)
}
print(arrs1)

var arrs2 = [String]()
func addVars2(fn: @autoclosure () -> Void) {
    arrs2 = Array(repeating: "", count: 3)
    fn()
}
addVars2(fn: arrs2.insert("3333", at: 0))
print(arrs2)
