//import Foundation
//
//func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
//    var result: [Int] = [Int]()
//    var report_sep: [[String]] = [[String]]()
//    var report_count = [Int]()
//    var report_id = [[Int]]()
//
//    let report = report.sorted()
//    for (idx, value) in report.enumerated() {
//        if idx > 0 {
//            if report[idx] == report[idx-1]{
//                continue
//            }
//        }
//        let a = value.components(separatedBy: " ")
//        report_sep.append(a)
//    }
//
//    print(report)
//    for _ in id_list {
////        result.append(0)
//        report_count.append(0)
//        report_id.append([0])
//    }
//    print(report_sep)
//    for value in report_sep {
//        let idx_0 = id_list.firstIndex(of: value[0])!
//        let idx_1 = id_list.firstIndex(of: value[1])!
//        report_id[idx_0].append(idx_1)
//        report_count[idx_1] += 1
//    }
//    print(report_id)
//    print(report_count)
//    for (index ,i) in report_id.enumerated() {
//        if i.count == 1 { continue }
//        for (idx, j) in i.enumerated() {
//            if idx == 0 { continue }
//            if report_count[j] >= k {
//                result[index] += 1
//            }
//        }
//    }
//    print("+++++++++")
//    return result
//}
//
//var id_list = ["muzi", "frodo", "apeach", "neo"]
//var report = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
//var k = 2
//
//solution(id_list, report, k)
//
//
//id_list = ["con", "ryan"]
//report = ["ryan con", "ryan con", "ryan con", "ryan con"]
//k = 3
//
//solution(id_list, report, k)
import Foundation

func solution1(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result = [Int]()
    var report_sep: [[String]] = [[String]]()
    var report_count = [Int]()
    var report_id = [[Int]]()
    
    let report = report.sorted()
    let count = report.count
    
    for idx in 0 ..< count {
        if idx > 0 {
            if report[idx] == report[idx-1]{
                continue
            }
        }
        let value = report[idx]
        let a = value.components(separatedBy: " ")
        report_sep.append(a)
    }
    
    //    let report = report.sorted()
    //    for (idx, value) in report.enumerated() {
    //        if idx > 0 {
    //            if report[idx] == report[idx-1]{
    //                continue
    //            }
    //        }
    //        let a = value.components(separatedBy: " ")
    //        report_sep.append(a)
    //    }
    
    for _ in id_list {
        result.append(0)
        report_count.append(0)
        report_id.append([0])
    }
    
    for value in report_sep {
        let idx_0 = id_list.firstIndex(of: value[0])!
        let idx_1 = id_list.firstIndex(of: value[1])!
        report_id[idx_0].append(idx_1)
        report_count[idx_1] += 1
    }
    for (index ,i) in report_id.enumerated() {
        if i.count == 1 { continue }
        for (idx, j) in i.enumerated() {
            if idx == 0 { continue }
            if report_count[j] >= k {
                result[index] += 1
            }
        }
    }
    return result
}

var id_list = ["muzi", "frodo", "apeach", "neo"]
var report = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
var k = 2

solution1(id_list, report, k)


id_list = ["con", "ryan"]
report = ["ryan con", "ryan con", "ryan con", "ryan con"]
k = 3

solution1(id_list, report, k)
