//: [Previous](@previous)
// https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/
// set 方法 题意不明，错误解法
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var map: [Int: Int] = [:]
    for num in nums {
        map[num] = num
    }
    return map.count
}
// 正确解法，双指针法
func removeDuplicates1(_ nums: inout [Int]) -> Int {
    if nums.count <= 1 {
        return nums.count
    }
    var j = 0
    for i in 1..<nums.count {
        if nums[i] != nums[j] {
            j += 1
            nums[j] = nums[i]
        }
    }
    return j + 1
}
