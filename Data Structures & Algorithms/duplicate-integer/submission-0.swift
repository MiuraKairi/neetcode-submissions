class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        // Swift has Set<>, so you can use it to eliminate duplications
        return Set(nums).count != nums.count
    }
}
