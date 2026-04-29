class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var countByKey: [Int: Int] = [:]
        for num in nums {
            countByKey[num, default: 0] += 1 
        }

        let sorted = countByKey.sorted { $0.value > $1.value }
        return Array(sorted.prefix(k).map {$0.key})
    }
}