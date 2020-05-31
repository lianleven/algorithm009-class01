
// Definition for a binary tree node.
 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 
 }

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        guard let root = root else { return [] }
        res.append(root.val)
        res += preorderTraversal(root.left)
        res += preorderTraversal(root.right)
        return res
    }
}
