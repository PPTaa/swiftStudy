import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var record:[[String]] = [[String]]()
    var car_fee = [String:[String]]()
    var car_time = [String:Int]()
    var result = [Int]()
    
    let basic_time = fees[0]
    let basic_fee = fees[1]
    let unit_time = fees[2]
    let unit_fee = fees[3]
    
    for i in records {
        let a = i.components(separatedBy: " ")
        record.append(a)
        car_fee[a[1]] = [""]
        car_time[a[1]] = 0
    }
    print(record)
    
    for (idx, i) in record.enumerated() {
        car_fee[i[1]]!.append(i[0])
    }
    
    for (car, time) in car_fee {
        if time.count % 2 == 0 {
            car_fee[car]!.append("23:59")
        }
    }
    
    print(car_fee)
    for (car_num, time) in car_fee {
        var time_list = [[String]]()
        for i in time {
            let time_convert = i.components(separatedBy: ":")
            if time_convert == [""] { continue }
            time_list.append(time_convert)
            print(time_list)
        }
        for i in stride(from: 1, through: time_list.count-1, by: 2) {
            let hour = Int(time_list[i][0])! - Int(time_list[i-1][0])!
            let min = Int(time_list[i][1])! - Int(time_list[i-1][1])!
            car_time[car_num]! += (hour*60 + min)
        }
        
        print("+++++++car_time : \(car_time)")
    }
    let aaa = car_time.sorted { $0.0 < $1.0 }
    print(aaa)
    for (car_num, time) in aaa {
        var cal_fee = Int(ceil(Double((time-basic_time))/Double(unit_time)))
        if cal_fee < 0 {
            cal_fee = 0
        }
        result.append(basic_fee + cal_fee * unit_fee)
    }
    
    
    return result
}
// [기본시간, 기본요금, 단위시간, 단위요금]
var fees = [180, 5000, 10, 600]
var records = ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]
solution(fees, records)
