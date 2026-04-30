class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let filteredCharacters = Array(
            s.lowercased().filter { $0.isLetter || $0.isNumber }
        )
        var startIndex = 0
        var endIndex = filteredCharacters.count - 1

        while startIndex < endIndex {
            if filteredCharacters[startIndex] != filteredCharacters[endIndex] {
                return false
            }
            
            startIndex += 1
            endIndex -= 1
        }

        return true
    }
}
