import Foundation

let s = "one4seveneightoneseventwonine"

func solution(_ s:String) -> Int {
    let numList = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
//    print(s.components(separatedBy: ["1","2","3","4","5","6","7","8","9","0"]))
    let count = s.count

//    for i in 0 ..< count {
//        let startTemp = s.index(s.startIndex, offsetBy: i)
//        for j in i ..< count{
//            let endTemp = s.index(s.startIndex, offsetBy: j)
//            let tempString: String = String(s[startTemp...endTemp])
//            print(tempString)
//
//            if numList.contains(tempString) {
//                print("________\(tempString)")
//                break
//            }
//        }
//    }
    var result = s
//    result = s.replacingOccurrences(of: "one", with: "1")
//    result = s.replacingOccurrences(of: "one", with: "1")
    for (i,v) in numList.enumerated() {
        print(i, v)
        result = result.replacingOccurrences(of: "\(v)", with: "\(i)")
//        print(result)
    }
    
    
    guard let a = Int(result) else { return 0 }
    
    return a
}

solution(s)
