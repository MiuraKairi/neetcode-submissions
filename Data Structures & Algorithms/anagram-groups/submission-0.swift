class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // Grouping string by their sorted representation using a hash map.
        var map: [String : [String]] = [:]
        for string in strs {
            let key = String(string.sorted())
            map[key, default:[]].append(string)
        }
        return Array(map.values)
    }
}
