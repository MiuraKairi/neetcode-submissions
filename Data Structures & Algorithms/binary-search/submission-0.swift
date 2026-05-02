class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var leftIndex = 0
        var rightIndex = nums.count - 1

        while leftIndex <= rightIndex {
            // Note: This uses (leftIndex + rightIndex) / 2 for simplicity.
            // In some languages, this may cause integer overflow if the indices are very large.
            // A safer alternative is: leftIndex + (rightIndex - leftIndex) / 2
            let middleIndex = (leftIndex + rightIndex) / 2
            let middleValue = nums[middleIndex]
            if middleValue == target {
                return middleIndex
            } else if middleValue < target {
                leftIndex = middleIndex + 1
            } else {
                rightIndex = middleIndex - 1
            }
        }
        return -1
    }
}
