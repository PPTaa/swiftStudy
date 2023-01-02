import Foundation
// k: 한상자에 담으려는 귤개수
// tangerine: 귤의 크기를 담은 배열
func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var tengerineDict: [Int:Int] = [Int: Int]()
    var k = k
    var result = 0
    for i in tangerine {
        if tengerineDict[i] != nil {
            tengerineDict[i]! += 1
        } else {
            tengerineDict[i] = 1
        }
    }
//    print(tengerineDict)
    let sortedDict = tengerineDict.sorted {
        $0.value > $1.value
    }
    
//    print(aaa)
    for (size, count) in sortedDict {
        print(k,size,count, separator: "//")
        if k - count > 0 {
            k -= count
            result += 1
        } else {
            result += 1
            break
        }
    }
    print("======")
    return result
}

solution(6, [1,3,2,5,4,5,2,3]) // 3
solution(4, [1,3,2,5,4,5,2,3]) // 2
solution(2, [1,1,1,1,2,2,2,3]) // 1
