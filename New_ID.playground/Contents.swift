import Foundation

func solution(_ new_id:String) -> String {
    // 1단계
    var id = new_id.lowercased()
    
    var result = ""
    let array_list = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","-","_","."]
    // 2단계
    for i in id {
        if array_list.contains(String(i)) {
            result += String(i)
        } else if Int(String(i)) != nil {
            result += String(i)
        }
    }
    // 3단계
    var tempArray = Array(result)
    var dot_index = [Int]()
    for i in 0..<tempArray.count {
        if i < tempArray.count - 1{
            if tempArray[i] == "." {
                if tempArray[i+1] == "." {
                    dot_index.append(i+1)
                }
            }
        }
    }
    
    for i in dot_index.reversed() {
        tempArray.remove(at: i)
    }
    
    // 4단계
    if tempArray[0] == "." {
        tempArray.remove(at: 0)
    }
    if tempArray == [] { // 5단계
        tempArray.append("a")
    }
    if tempArray[tempArray.endIndex - 1] == "." {
        tempArray.remove(at: tempArray.endIndex - 1)
    }
    
    // 6단계
    result = String(tempArray)
    let slice_result = result.prefix(15)
    tempArray = Array(slice_result)
    if tempArray[tempArray.endIndex-1] == "." {
        tempArray.remove(at: tempArray.endIndex-1)
    }
    // 7단계
    while tempArray.endIndex <= 2 {
        tempArray.append(tempArray[tempArray.endIndex-1])
    }
    
//    print(tempArray)
//    print(result)
//    print(slice_result)
    return String(tempArray)
}

solution("...!@BaT#*..y.abcdefghijklm")
solution("z-+.^.")
solution("=.=")
solution("123_.def")
solution("abcdefghijklmn.p")
