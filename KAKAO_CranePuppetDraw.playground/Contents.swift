import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var result: Int = 0
    var box = [Int]()
    var board = board
    
    for move in moves {
//        print(move)
        for (idx, row) in board.enumerated() {
//            print(row)
            if row[move-1] == 0 { // 뽑고싶은 컬럼의 로우값이 0 이면 pass
                continue
            } else { // 0이 아니면 뽑아서 box에 추가
                if box.last == row[move-1] { // box의 마지막 값이 뽑은 값과 같다면 없어지는것으로 판단하여 box의 마지막 원소 제거, result를 2 증가시킴
                    result += 2
                    box.popLast()
                } else { // 뽑은값과 box의 마지막 값이 같지 않다면 box에 원소 추가
                    box.append(row[move-1])
                }
                // 마지막으로 뽑은 값은 0으로 변경
                board[idx][move-1] = 0
                break
            }
        }
    }
//    print(box)
    return result
}

let board =  [[0,0,0,0,0],
              [0,0,1,0,3],
              [0,2,5,0,1],
              [4,2,4,4,2],
              [3,5,1,3,1]]

let moves = [1,5,3,5,1,2,1,4]

solution(board, moves)
//431132x4
