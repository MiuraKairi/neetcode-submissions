class Solution {
    func encode(_ strs: [String]) -> String {
        // Encode string by .count and #
        // ["Hello","World"] → "5#Hello5#World"
        var encoded = ""
        for word in strs {
            let length = word.count
            encoded += "\(length)#\(word)"
        }
        return encoded
    }

    func decode(_ str: String) -> [String] {
        var result: [String] = []
        var currentIndex = str.startIndex
        while currentIndex < str.endIndex {
            // 1. Find the delimiter "#"
            var lengthEndIndex = currentIndex
            while str[lengthEndIndex] != "#" {
                lengthEndIndex = str.index(after: lengthEndIndex)
            }
            // 2. Parse the length
            let lengthString = str[currentIndex..<lengthEndIndex]
            let wordLength = Int(lengthString)!
            // 3. Move past "#"
            let contentStartIndex = str.index(after: lengthEndIndex)
            // 4. Extract the substring
            let contentEndIndex = str.index(contentStartIndex, offsetBy: wordLength)
            let word = String(str[contentStartIndex..<contentEndIndex])
            result.append(word)
            // 5. Move to next segment
            currentIndex = contentEndIndex
        }
        return result
    }
}
