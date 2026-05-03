class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rowCount = matrix.count
        let columnCount = matrix[0].count
        // The key idea is to treat the matrix as a flattened 1D array.
        var lowerFlatIndex = 0
        var upperFlatIndex = rowCount * columnCount - 1

        while lowerFlatIndex <= upperFlatIndex {
            let middleFlatIndex = (lowerFlatIndex + upperFlatIndex) / 2
            // Convert the 1D index into a 2D position.　Example when columnCount = 4:
            // matrix shape:
            //        col0 col1 col2 col3
            // row0    0    1    2    3
            // row1    4    5    6    7
            // row2    8    9   10   11
            //
            // Think of it as:
            // - Each row contains 4 elements
            // - Every time index increases by 4, we move to the next row
            //
            // Example: middleIndex = 6
            //
            // middleRowIndex = 6 / 4 = 1 → "how many full rows are before this index"
            // middleColumnIndex = 6 % 4 = 2 → "position inside the row (remainder)"
            // Therefore: matrix[1][2]
            let middleRowIndex = middleFlatIndex / columnCount
            let middleColumnIndex = middleFlatIndex % columnCount
            let middleValue = matrix[middleRowIndex][middleColumnIndex]

            if middleValue == target {
                return true
            } else if middleValue < target {
                lowerFlatIndex = middleFlatIndex + 1
            } else {
                upperFlatIndex = middleFlatIndex - 1
            }
        }
        return false
    }
}

// MEMO:
// 1次元の flattenedIndex と 2次元の (rowIndex, columnIndex) は相互に変換できる。
//
// --- 2D → 1D の変換 ---
//
//         col0  col1  col2  col3
//        +-----+-----+-----+-----+
// row0   |  0  |  1  |  2  |  3  |
//        +-----+-----+-----+-----+
// row1   |  4  |  5  | [6] |  7  |
//        +-----+-----+-----+-----+
// row2   |  8  |  9  | 10  | 11  |
//        +-----+-----+-----+-----+
// 
// 式：flattenIndex = (1) rowIndex * columnCount + (2) columnIndex
// ※ columnCount は折り返し地点。
// 
// (1)その行より前にある「すべての要素数」
// 　→ rowIndex * columnCount で「何行分進んだか（何個スキップしたか）」がわかる。
// (2) その行の中でのオフセット（位置）
// 
//
// --- 1D → 2D の変換 ---
//
//         col0  col1  col2  col3
//        +-----+-----+-----+-----+
// row0   |  0  |  1  |  2  |  3  |
//        +-----+-----+-----+-----+
// row1   |  4  |  5  | [6] |  7  |
//        +-----+-----+-----+-----+
// row2   |  8  |  9  | 10  | 11  |
//        +-----+-----+-----+-----+
//
// rowIndex    = flattenedIndex / columnCount
// columnIndex = flattenedIndex % columnCount
//
// 意味:
// columnCount は「何個ごとに折り返すか」を決める値。
//
// → 割り算:
//    何回折り返したか = 何行進んだか（rowIndex）
// → 余り:
//    折り返し後の残り = 行の中での位置（columnIndex）
