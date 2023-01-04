import Foundation

// 괄호가 갯수는 맞지만 짝이 맞지 않는 형태임
// 예를 들어, "(()))("와 같은 문자열은 "균형잡힌 괄호 문자열" 이지만 "올바른 괄호 문자열"은 아닙니다.
// 반면에 "(())()"와 같은 문자열은 "균형잡힌 괄호 문자열" 이면서 동시에 "올바른 괄호 문자열" 입니다.
func solution(_ p:String) -> String {
    return splitString(p: p)
}

func splitString(p: String) -> String {
    // MARK: - 1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
    if p == "" {
        return ""
    }
    
    // MARK: - 2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다. 단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
    var balanceString: [Character: Int] = [
        "(" : 0,
        ")" : 0
    ]
    var splitIdx = 0
    
    for (idx, value) in p.enumerated() {
        balanceString[value]! += 1
        if balanceString["("] == balanceString[")"] {
            splitIdx = idx
            break
        }
    }
    let arrayCharacter:Array<Character> = Array(p)
    var (u, v) = (String(arrayCharacter[0...splitIdx]), String(arrayCharacter[splitIdx+1..<p.count]))
    
    if u.last == ")" { // MARK: - 3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다.
        // 3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
        return u + splitString(p: v)
    } else { // MARK: - 4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
        // 4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
        var word = "("
        // 4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
        word += splitString(p: v)
        // 4-3. ')'를 다시 붙입니다.
        word += ")"
        // 4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
        u.removeFirst()
        u.removeLast()
        word += changeCenter(center: u)
        // 4-5. 생성된 문자열을 반환합니다.
        return word
    }
    
    return ""
}

// 괄호 방향 반전시켜주는 함수
func changeCenter(center: String) -> String {
    return center.map {
        if $0 == "(" {
            return ")"
        } else {
            return "("
        }
    }.joined()
}

solution("(()())()") //
solution(")(")
solution("()))((()")
solution("))))((((")
solution(")()(()") //

//solution(")()())())((")
