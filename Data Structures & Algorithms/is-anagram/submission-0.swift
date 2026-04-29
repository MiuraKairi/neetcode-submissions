class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // String conforms to Sequence, so you can use `sorted()`.
        // string.sorted() returns an array of Character([Character]), not a String
        return s.sorted() == t.sorted()
    }
}
