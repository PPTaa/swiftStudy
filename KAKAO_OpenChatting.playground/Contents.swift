import Foundation

func solution(_ record:[String]) -> [String] {
    var idDict = [String: String]()
    var result = [String]()
    for i in record {
        var temp = i.components(separatedBy: " ")
        if temp[0] == "Enter" {
            idDict[String(temp[1])] = String(temp[2])
        } else if temp[0] == "Change" {
            idDict[String(temp[1])] = String(temp[2])
        }
    }
    
    for i in record {
        var temp = i.components(separatedBy: " ")
        if temp[0] == "Enter" {
            result.append("\(idDict[temp[1]]!)님이 들어왔습니다.")
        } else if temp[0] == "Leave" {
            result.append("\(idDict[temp[1]]!)님이 나갔습니다.")
        }
        
    }
    
    return result
}

solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])
//["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]

