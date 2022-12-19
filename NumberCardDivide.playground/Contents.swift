import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    var result = 0
    // arrayA의 공약수들을 구해 commonFactorA에 리스트로 저장
    var commonFactorA = [Int]()
    arrayA.sorted { $0 > $1 }
    var lastGCDA = arrayA[0]
    for i in 0..<arrayA.count-1 {
        lastGCDA = gcd(lastGCDA, arrayA[i+1])
    }
    print("최대공약수 A", lastGCDA)
    if lastGCDA >= 2 {
        for i in 2...lastGCDA {
            if lastGCDA % i == 0 {
                commonFactorA.append(i)
            }
        }
    }
    print("commonFactorA", commonFactorA)
    
    // arrayB의 공약수들을 구해 commonFactorB에 리스트로 저장
    var commonFactorB = [Int]()
    arrayB.sorted { $0 > $1 }
    var lastGCDB = arrayB[0]
    for i in 0..<arrayB.count-1 {
        lastGCDB = gcd(lastGCDB, arrayB[i+1])
    }
    print("최대공약수 B", lastGCDB)
    if lastGCDB >= 2 {
        for i in 2...lastGCDB {
            if lastGCDB % i == 0 {
                commonFactorB.append(i)
            }
        }
    }
    print("commonFactorB", commonFactorB)
    
    print(commonFactorA + commonFactorB)
    
    // commonFactorA 와 commonFactorB를 연결한 후 중복을 제거하여 반복문 실행
    for factor in Set(commonFactorA + commonFactorB) {
        // 판별 변수 초기화
        var bool = true
        // arrayA에서 공약수로 나눌수 있는 경우 && arrayB에서 공약수로 나눌수 없는 경우
        for i in 0..<arrayA.count {
            // arrayA에서 공약수로 나눌수 없는 경우
            // arrayB에서 공약수로 나눌수 있는 경우
            // 위 두가지 경우중 하나에 해당 되는 경우 -> false
            // 모두 해당되지 않는 경우 -> true
            if (arrayA[i] % factor != 0) || (arrayB[i] % factor == 0) {
                bool = false
                break
            }
        }
        // true인 경우에만 result값 업데이트
        if bool { result = max(result, factor) }
        
        
        // 판별 변수 초기화
        bool = true
        // arrayA에서 공약수로 나눌수 없는 경우 && arrayB에서 공약수로 나눌수 있는 경우
        for i in 0..<arrayB.count {
            // arrayA에서 공약수로 나눌수 있는 경우
            // arrayB에서 공약수로 나눌수 없는 경우
            // 위 두가지 경우중 하나에 해당 되는 경우 -> false
            // 모두 해당되지 않는 경우 -> true
            if (arrayA[i] % factor == 0) || (arrayB[i] % factor != 0) {
                bool = false
                break
            }
        }
        // true인 경우에만 result값 업데이트
        if bool { result = max(result, factor) }
    }
    
    return result
}

//유클리디언 호제법을 이용한 최대공약수 찾기
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a%b)
    }
}


solution([10,17], [5,20]) // 0
solution([10,20], [5,17]) // 10
solution([14,35,119], [8,30,102]) // 7

