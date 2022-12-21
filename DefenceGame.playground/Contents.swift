import Foundation

// n= 병사
// 매라운드마다 enemy[i] 적등장
// 병사를 소모하여 방어가능
// k = 무적권 횟수
// 최대한 많은 라운드 진행
func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var life = n
    var ticketNum = k
    if k >= enemy.count {
        return enemy.count
    }
    
    var enemy = enemy
    let sortedEnemy = enemy.sorted(by: <)
//    print(enemy)
    
//    var ticket:[Int] = sortedEnemy[(sortedEnemy.count - k)..<sortedEnemy.count].map { $0 }
//    print(ticket)
    
//    for (idx, wave) in enemy.enumerated() {
//
//        print("wave \(idx)", wave, "/ ", life)
//        // 첫 번호가 존재하는 경우
//        if binarySearch(searchNumber: wave, searchList: ticket) {
//            if let ticketIdx = ticket.firstIndex(of: wave) {
//                ticket.remove(at: ticketIdx)
//            }
//            continue
//        }
//
//        if life < wave {
//            if ticket.isEmpty {
//                return idx
//            } else {
//                print(idx, ticket)
//                ticket.removeFirst()
//            }
//        } else {
//            life = life - wave
//        }
//        print("-> life : ", life)
//    }
    var temp = [Int]()
    var heap: Heap<Int> = Heap(sortFunction: >)
    
    var result = 0
    for wave in enemy {
        print("wave", wave, "//", life)
        result += 1
        life -= wave
        heap.insert(node: wave)
//        temp.append(wave)
//        temp.sort()
    
        if life < 0 {
            if ticketNum > 0 {
                let popValue = heap.remove() ?? 0
                print(popValue)
//                let popValue = temp.popLast() ?? 0 //
                life += popValue // 라이프 증가
                ticketNum -= 1
            } else {
                result -= 1
                break
            }
        }
        print("ticketNum: ",ticketNum)
        print("life: ",life)
        print("wave: ",wave)
        print("round: ",result)
        print("==================")
    }
    
    
    return result
}

func binarySearch(searchNumber: Int, searchList: [Int]) -> Bool {
    var start = 0
    var end = searchList.count
    while start < end {
        let mid = (end + start) / 2
        
        if searchList[mid] == searchNumber { return true }
        if searchList[mid] > searchNumber {
            end = mid
        } else {
            start = mid + 1
        }
    }
    return false
}

solution(1, 4, [5,4,3,2,2,1]) //  4

solution(7, 3, [4,2,4,5,3,3,1]) //  5
//solution(2, 4, [3,3,3,3])    // 4

solution(1, 5, [1,2,3,4,5,6,7,8,9,10]) // 6
solution(1, 5, [1,2,3,4,10,6,7,8,9,10]) // 6
//
solution(2, 1, [1,2,10]) // 2

solution(10, 3, [1,2,3,4,56,1,4,6,100,100,100,100,1000]) // 7
solution(10, 3, [1,23,3,43,56,1,4,6,100,100,100,100,1000]) // 7

solution(10, 3, [100,2,33,4,56,1,4,6,100,100,100,100,1000]) // 6

solution(100, 3, [54,53,52,1,1,1,1, 98, 99, 100]) // 8


solution(3, 2, [1,2,10]) // 3
solution(3, 2, [1,2,3]) // 3

solution(3, 2, [1,2,10,10,2,1]) // 4
solution(3, 2, [1,2,3,2,3,2,3,4]) // 4

solution(0, 2, [1,2,3,2,3,2,3,4]) // 2

solution(0, 2, [2,3,2,3,2,3,4,4]) // 2

solution(0, 5, [1,1,1,1,1,1,1,1,1,1]) // 5

struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let sortFunction: (T, T) -> Bool
    
    var isEmpty: Bool {
        return self.elements.count == 1
    }
    var peek: T? {
        if self.isEmpty { return nil }
        return self.elements.last!
    }
    var count: Int {
        return self.elements.count - 1
    }
    
    init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
        if !elements.isEmpty {
            self.elements = [elements.first!] + elements
        } else {
            self.elements = elements
        }
        self.sortFunction = sortFunction
        if elements.count > 1 {
            self.buildHeap()
        }
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    func parent(of index: Int) -> Int {
        return (index) / 2
    }
    mutating func add(element: T) {
        self.elements.append(element)
    }
    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = self.leftChild(of: index)
        let rightIndex = self.rightChild(of: index)
        
        if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
            higherPriority = leftIndex
        }
        if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
            higherPriority = rightIndex
        }
        if higherPriority != index {
            self.elements.swapAt(higherPriority, index)
            self.diveDown(from: higherPriority)
        }
    }
    mutating func swimUp(from index: Int) {
        var index = index
        while index != 1 && self.sortFunction(self.elements[index], self.elements[self.parent(of: index)]) {
            self.elements.swapAt(index, self.parent(of: index))
            index = self.parent(of: index)
        }
    }
    mutating func buildHeap() {
        for index in (1...(self.elements.count / 2)).reversed() {
            self.diveDown(from: index)
        }
    }
    mutating func insert(node: T) {
        if self.elements.isEmpty {
            self.elements.append(node)
        }
        self.elements.append(node)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    mutating func remove() -> T? {
        if self.isEmpty { return nil }
        self.elements.swapAt(1, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 1)
        
        return deleted
    }
}
