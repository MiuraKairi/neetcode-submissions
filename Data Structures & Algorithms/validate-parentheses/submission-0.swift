class Solution {
    func isValid(_ s: String) -> Bool {
        let openingBrackets: Set<Character> = ["(", "{", "["]
        let matchingBracket: [Character: Character] = [
            ")" : "(",
            "}" : "{",
            "]" : "["
        ]

        var bracketStack: [Character] = []
        for char in s {
            if openingBrackets.contains(char) {
                bracketStack.append(char)
                continue
            }
            guard bracketStack.popLast() == matchingBracket[char] else {
                return false
            }
        }
        return bracketStack.isEmpty
    }
}
