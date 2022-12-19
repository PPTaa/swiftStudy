import Foundation

func solution(_ scores:[[Int]]) -> String {
    var result = ""
    var scoresCount = scores[0].count
    for i in 0..<scoresCount {
        var scoreList = [Int]()
        var myScore = 0
        for (j, score) in scores.enumerated() {
            scoreList.append(score[i])
            if i == j {
                myScore = score[i]
            }
        }
        print(scoreList,"+++++++")
        let max = scoreList.max()
        let min = scoreList.min()
        if max == myScore {
            print("max")
            let firstIdx = scoreList.firstIndex(of: myScore)
            let lastIdx = scoreList.lastIndex(of: myScore)
            if firstIdx == lastIdx {
                scoreList[firstIdx ?? 0] = 1000
            } else {
            }
        } else if min == myScore {
            print("min")
            let firstIdx = scoreList.firstIndex(of: myScore)
            let lastIdx = scoreList.lastIndex(of: myScore)
            if firstIdx == lastIdx {
                scoreList[firstIdx ?? 0] = 1000
            } else {
            }
        }
        print(myScore,"+++++++")
        print(scoreList,"_______")
        var tempScore: Double = 0.0
        var tempcount = scoreList.count
        print("aa")
        for i in scoreList {
            if i <= 100 {
                tempScore += Double(i)
            } else {
                tempcount -= 1
            }
        }
        print("bb")
        tempScore = tempScore / Double(tempcount)
        
        print("cc")
        if tempScore >= 90 {
            result += "A"
        } else if tempScore >= 80 {
            result += "B"
        } else if tempScore >= 70 {
            result += "C"
        } else if tempScore >= 50 {
            result += "D"
        } else {
            result += "F"
        }
        print("dd")
        
    }
    return result
}


var scores = [[100,90,98,88,65],[50,45,99,85,77],[47,88,95,80,67],[61,57,100,80,65],[24,90,94,75,65]]
//solution(scores)

scores = [[50,90],[50,87]]
solution(scores)
