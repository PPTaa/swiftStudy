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
    
    // commonFactorA 와 commonFactorB를 연결한 후
    for factor in Set(commonFactorA + commonFactorB) {
        var bool = true
        // A == O , B == X
        for i in 0..<arrayA.count {
            print(arrayA[i], "%", factor , "||", arrayB[i], "%", factor)
            if (arrayA[i] % factor == 0) || (arrayB[i] % factor != 0) {
                bool = false
                break
            }
        }
        
        if bool { result = max(result, factor) }
        print(result)
        
        bool = true
        for i in 0..<arrayB.count {
            print(arrayA[i], "%", factor , "||", arrayB[i], "%", factor)
            if (arrayA[i] % factor != 0) || (arrayB[i] % factor == 0) {
                bool = false
                break
            }
        }
        
        if bool { result = max(result, factor) }
        print(result)
    }
//
//
//    var result = 0
//    if commonFactorA == [] {
//        for int in commonFactorB {
//            var count = 0
//            for intA in arrayA {
//                print( "\(intA) % \(int)",intA % int)
//                if intA % int != 0 {
//                    count += 1
//                }
//            }
//            if count == commonFactorA.count {
//                result = int
//            }
//        }
//    } else {
//        for int in commonFactorA {
//            var count = 0
//            for intB in arrayB {
//                print( "\(intB) % \(int)",intB % int)
//                if intB % int != 0 {
//                    count += 1
//                }
//            }
//            print(count)
//            if count == arrayB.count {
//                result = int
//            }
//        }
//
//    }
//    return result
    
//
//    let minA = arrayA[0]
//
//    for i in 2...minA {
//        if minA % i == 0 {
//            commonFactorA.append(i)
//        }
//    }
//
//    for i in commonFactorA {
//        for j in arrayA {
////            print(i, j)
////            print("j%i = ",j%i)
//            if j % i != 0 {
//                commonFactorA.removeAll(where: { $0 == i })
//            }
//        }
//    }
//
//    print("commonFactorA", commonFactorA)
//
//    var commonFactorB = [Int]()
//    if commonFactorA != [] {
//        // 첫번째 어레이의 공약수 중 두번째 어레이의 공약수가 되는지 판별
//        for i in commonFactorA.reversed() {
//            print(i)
//            var cert = 0
//            for j in arrayB {
//                if j % i == 0 {
//                    cert += 1
//                }
//            }
//            if cert == 0 {
//                commonFactorB.append(i)
//                break
//            }
//        }
////        print("commonFactorB", commonFactorB)
//    } else {
//        // 첫번째 어레이가 비었다면 두번째 어레이의 최대공약수 값이 정답
//        arrayB.sorted { $0 > $1 }
//        let minB = arrayB[0]
//
//        for i in 2...minB {
//            if minB % i == 0 {
//                commonFactorB.append(i)
//            }
//        }
//
//        for i in commonFactorB {
//            for j in arrayB {
//    //            print(i, j)
//    //            print("j%i = ",j%i)
//                if j % i != 0 {
//                    commonFactorB.removeAll(where: { $0 == i })
//                }
//            }
//        }
//    }
//
//    print("commonFactorB", commonFactorB)
//
    
    return result
}

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

