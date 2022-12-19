import Foundation
// R -> G -> B
func solution(_ n:Int, _ k:Int, _ bulbs:String) -> Int {

    var bulbList:[String] = bulbs.map {String($0)}
    print(bulbList)
    for (idx, bulbsColor) in bulbList.enumerated() {
        if (idx + k) > n {
            break
        }
        if bulbsColor == "R" {
            continue
        } else {
            for i in bulbList[idx...idx+k-1] {
                bulbList[idx+i] = (changeBulb(bulb: i))
                
            }
        }
    }

    return -2
}

func changeBulb(bulb: String) -> String{
    if bulb == "R" { return "G"}
    else if bulb == "G" { return "B"}
    else { return "R"}
}
solution(6, 3, "RBGRGB")


