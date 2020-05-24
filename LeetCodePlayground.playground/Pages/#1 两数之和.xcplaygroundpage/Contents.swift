//: [Previous](@previous)

/**  leetcode 1
 
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 
 示例:
 
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */
 // 两数之和
 func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
     var dict = [Int:Int]()
     for (i,num) in nums.enumerated(){
         if let index = dict[target - num]{
            return [i,index]
         }
         else{
            dict[num] = i;
         }

     }
     fatalError("No valid output")
 }
 print(twoSum([2,7,11,15], 9))

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var result = triangle[triangle.count - 1]
        for i in (0...(triangle.count - 2)).reversed() {
            for j in 0..<(triangle[i].count) {
                result[j] = triangle[i][j] + min(result[j], result[j + 1])
            }
        }
        return result[0]
    }
}

