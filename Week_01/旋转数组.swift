// https://leetcode-cn.com/problems/rotate-array/

// 利用数组的api，进行插入，时间复杂度是 O(k * nums.count)所以是 O(n^2)
func rotate(_ nums: inout [Int], _ k: Int) {
    if nums.count <= 1 || k == 0 {
        return
    }
    for _ in 1...k {
        let num = nums.last!
        nums.insert(num, at: 0)
        nums.removeLast()
    }
}
var arr = [2, 3]
rotate(&arr,1)
print(arr)
// 看java 题解，反转
func rotate2(_ nums: inout [Int], _ k: Int) {
    
    var tempk = k % (nums.count)
    
    reverse(&nums, 0, nums.count - 1)
    reverse(&nums, 0, tempk - 1)
    reverse(&nums, tempk, nums.count - 1)
}
func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
    var startIndex = start
    var endIndex = end
    while startIndex < endIndex {
        let temp = nums[startIndex]
        nums[startIndex] = nums[endIndex]
        nums[endIndex] = temp
        startIndex += 1
        endIndex -= 1
    }
}

var arr1 = [2, 3, 7, 9, 8]
rotate(&arr1,2)
print(arr1)
