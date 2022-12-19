import Foundation
// 효율성 미통과
func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    var board = board
    let count = skill.count
    
    for i in 0..<count {
        let type = skill[i][0]
        let start = (skill[i][1], skill[i][2])
        let end = (skill[i][3], skill[i][4])
        let degree = skill[i][5]
        print(type, start, end, degree)
        if degree == 0 { continue }
        
        for (row, j) in board.enumerated() {
            print("j \(row): \(j)")
            var col = start.1
            if (start.0 ... end.0).contains(row) {
                for k in j[start.1 ... end.1]{
                    print("col: \(col) , k: \(k)" )
                    if type == 1 {
                        board[row][col] -= degree
                    } else {
                        board[row][col] += degree
                    }
                    col += 1
                }
            }
        }
    }
    var result = 0
    for i in board {
        for j in i {
            if j > 0 {
                result += 1
            }
        }
    }
    return result
}
var board = [[5,5,5,5,5],
             [5,5,5,5,5],
             [5,5,5,5,5],
             [5,5,5,5,5]]

//[type, r1, c1, r2, c2, degree]
// type - 1: 적의공격, 2: 아군 회복
// (r1, c1) - 스킬 시작점
// (r2, c2) - 스킬 종료점
// degree - 스킬 피해, 회복량
var skill = [[1,0,0,3,4,4],
             [1,2,0,2,3,2],
             [2,1,0,3,1,2],
             [1,0,1,3,3,1]]

solution(board, skill)
board = [[1,2,3],
         [4,5,6],
         [7,8,9]]
skill = [[1,1,1,2,2,4],
         [1,0,0,1,1,2],
         [2,2,0,2,0,100]]

solution(board, skill)
