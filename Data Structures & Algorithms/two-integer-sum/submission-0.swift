class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Use a dictionary to map values to their indices.
        var map: [Int: Int] = [:]
        for (index, value) in nums.enumerated() {
            // complement is the value we need to reach the target, value and complement is the answer.
            // For each number, compute its complement and check if it has been seen.
            let complement = target - value
            if let expect = map[complement] {
                return [expect, index]
            }
            map[value] = index
        }
        return []
    }
}
