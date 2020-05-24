// https://leetcode-cn.com/problems/merge-sorted-array/
// 解法错误
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    nums1.append(contentsOf: nums2)
    nums1.sort { (num1, num2) -> Bool in
        return num1 < num2
    }
}
