// All possible directions
enum Directions {
    case right
    case left
    case down
    case up
}

func spiralForm(matrix: [[Int]]) -> [Int] {
    var currMatrix = matrix
    var rowSize = matrix[0].count
    var columSize = matrix.count
    let matrixSize = rowSize * columSize
    
    var direction = Directions.right
    var currRowIndex = 0
    
    var output = [Int]()
    
    while output.count < matrixSize {
        for x in 0..<rowSize {
            if direction == .right {
                output.append(currMatrix[currRowIndex].removeFirst())
            }
            if direction == .left {
                output.append(currMatrix[currRowIndex].removeLast())
            }
        }
        
        if direction == .right {
            direction = .down
        } else {
            direction = .up
        }
        
        currMatrix.remove(at: currRowIndex)
        columSize = currMatrix.count
        rowSize = rowSize - 1
        
        for y in 0..<columSize {
            if direction == .down {
                output.append(currMatrix[y].removeLast())
            }
            if direction == .up {
                output.append(currMatrix[(columSize-1)-y].removeFirst())
            }
        }
        
        if direction == .down {
            direction = .left
            currRowIndex = currMatrix.count - 1
        } else {
            direction = .right
            currRowIndex = 0
        }
    }
    
    return output
}
  

var matrix = [[1, 2, 3, 4],
              [8, 7, 6, 5],
              [9, 10, 11, 12],
              [16, 15, 14, 13]]

print(spiralForm(matrix: matrix))
// result: [1, 2, 3, 4, 5, 12, 13, 14, 15, 16, 9, 8, 7, 6, 11, 10]
