import Foundation


// 개발언어 cpp, java, python
// 직군 back, front
// 경력 junior, senior
// 푸드 chicken, pizza
func solution(_ info:[String], _ query:[String]) -> [Int] {
    // 쿼리와 인포를 각 리스트로 쪼갬
    let infoList = info.map {
        $0.components(separatedBy: " ")
    }
    print(infoList)
    
    var queryList = query.map {
        $0.components(separatedBy: " ")
    }
    
    for i in 0 ..< queryList.count {
        queryList[i].removeAll { $0 == "and"}
    }
    
    print(queryList)
    var result = Array.init(repeating: 0, count: queryList.count)
    for (idx, query) in queryList.enumerated() {
        for info in infoList {
//            print(zip(info, query))
            if info[0] != query[0] && query[0] != "-" {
//                print(info[0], query[0])
                continue
            }
            if info[1] != query[1] && query[1] != "-" {
//                print(info[0], query[0])
                continue
            }
            if info[2] != query[2] && query[2] != "-" {
//                print(info[0], query[0])
                continue
            }
            if info[3] != query[3] && query[3] != "-" {
//                print(info[0], query[0])
                continue
            }
            
            if let infoScore = Int(info[4]),
               let queryScore = Int(query[4]),
               infoScore >= queryScore {
                print(infoScore, ">", queryScore)
                result[idx] += 1
            }
        }
    }
        
    return result
}

let info = ["java backend junior pizza 150","java backend junior pizza 150","java backend junior pizza 150","java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"]
let query = ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]

func solution2(_ info:[String], _ query:[String]) -> [Int] {
//    인포를 리스트로 나눔
//    let infoList = info.map {
//        $0.components(separatedBy: " ")
//    }

    var infoDict: [String: [Int]] = [:]
    // info값을 딕셔너리로 재구성
    // 조건을 key, 점수를 value의 리스트로
    for i in info {
        let data = i.components(separatedBy: " ")
        
        let list0 = [data[0], "-"]
        let list1 = [data[1], "-"]
        let list2 = [data[2], "-"]
        let list3 = [data[3], "-"]
        let list4 = Int(data[4])!
        for zero in list0 {
            for one in list1 {
                for two in list2 {
                    for three in list3 {
                        let key = "\(zero) and \(one) and \(two) and \(three)"
                        if infoDict[key] != nil {
                            infoDict[key]?.append(list4)
                        } else {
                            infoDict[key] = [list4]
                        }
                    }
                }
            }
        }
    }
    // 이진 탐색을 위해서 점수값 오름차순 소팅
    for data in infoDict {
        let sortedScore = data.value.sorted()
        infoDict[data.key] = sortedScore
    }
    
    // 재구성된 딕셔너리와 비교하기 위한 쿼리 재구성 ex) [("- and - and - and chicken", 100)]
    let queryList = query.map {
            $0.components(separatedBy: " ")
        }
        .map{
            ($0[0...6].joined(separator: " "), Int($0[7])!)
        }
            
    // 결과값 초기화
    var result = Array.init(repeating: 0, count: queryList.count)
    // 재구성된 쿼리값과 같은 딕셔너리 값의 점수중 쿼리의 점수보다 높은 값의 갯수 찾음
    // 이진탐색, lower bound를 사용하여 효율 증대
    for (idx, data) in queryList.enumerated() {
        if let scoreList = infoDict[data.0] {
            print(scoreList,"vs", data.1)
            // 고차함수인 filter를 사용해서 풀려고 했으나 효율성 실패...
//            result[idx] = scoreList.filter({$0 >= data.1}).count
            // 이진탐색 시작
            var start = 0
            var end = scoreList.count
            while start < end {
                let mid = (start + end) / 2
                print(start, mid, end)
                if scoreList[mid] >= data.1 { // 같은 수여도 가장 앞의 것을 가져와야함 (lower bound)
                    end = mid
                } else {
                    start = mid + 1
                }
            }
            print(start)
            print(end)
            // 전체 갯수 - lower bound가 갯수가 됨
            result[idx] = scoreList.count - start
        } else {
            result[idx] = 0
        }
    }
//    print(result)
    
   
        
    return result
}

solution2(info, query)
