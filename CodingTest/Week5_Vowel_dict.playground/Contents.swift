import Foundation

func solution(_ word:String) -> Int {
    let vowelList = ["A", "E", "I", "O", "U"]
    var testWord = ["A"]
    var wordList = [String]()
    var count = 1
    
    for i in word {
        wordList.append(String(i))
    }
    
    print("======================")
    while testWord != wordList {
        // 5개 글자가 아니면 A추가
        if testWord.count < 5 {
            testWord.append("A")
        } else { // 5개 글자일 때
            // 마지막 글자의 인덱스를 가져옴
            let a = vowelList.firstIndex(of: testWord.last!)!
            // 마지막 글자가 U일때
            if testWord.last == "U" {
                // 마지막 글자가 U이면 마지막 글자 제거 (반복)
                while testWord.last == "U" {
                    testWord.popLast()
                }
                // 남은 한 글자를 제거하고 그 글자를 저장
                let b = testWord.popLast()!
                // 그 글자의 다음 글자를 마지막에 추가
                testWord.append(vowelList[vowelList.firstIndex(of: b)! + 1])
            } else { // 마지막 글자가 U가 아닐때
                let count_list = testWord.count - 1
                // 마지막 글자를 다음 글자로 변경
                testWord[count_list] = vowelList[a+1]
            }
        }
        print("++++ \(testWord)")
        count += 1
    }
    
    return count
}
solution("AAAAE")

solution("AAAE")
solution("AAAEO")

solution("AAAO")
solution("AAAU")
solution("AAAUU")
solution("AAEAA")
solution("AEEAA")
//
solution("I")
//
solution("EIO")
solution("UUUUU")

