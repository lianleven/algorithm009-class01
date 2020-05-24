
/** leetcode 206
 
 反转一个单链表。
 
 示例:
 
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 
 */

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
}
extension ListNode: CustomStringConvertible {
    var description: String {
        guard let next = next else { return "\(val)" }
        return "\(val) -> \(String(describing: next)) "
    }
}
// 链表输入
func inputList(_ list: [Int]) -> ListNode? {
    if list.count == 0 {
        return nil
    }
    let firstNode = ListNode(list.first!)
    if list.count > 1 {
        var tempNode = firstNode
        for i in 1...list.count-1 {
            let node = ListNode(list[i])
            tempNode.next = node
            tempNode = node
        }
    }
    return firstNode
}


/******************* 算法实现 *******************/

// 迭代反转
func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    var cur = head
    var pre: ListNode?
    var temp: ListNode?
    while cur != nil {
        temp = cur?.next
        cur?.next = pre
        pre = cur
        cur = temp
    }
    return pre
}
// 递归反转
func reverseList(_ head: ListNode?, _ newHead: ListNode? = nil) -> ListNode? {
    if head == nil{
        return newHead
    }
    let next = head?.next
    head?.next = newHead
    
    return reverseList(next, head)
}
// 递归反转
func reverseList3(_ head: ListNode?) -> ListNode? {
    if head?.next == nil{
        return head
    }
    print("\n\(head!)\n")
    let newHead = reverseList3(head?.next)
    print("\n\(head!) ----- \(newHead!)\n")
    head?.next?.next = head
    head?.next = nil
    print("\n\(head!)\n")
    return newHead
}


var node = inputList([1,2,3,4,5])
//print("\n单链表:\n \(node!)")
//print("\n迭代反转单链表:\n \(reverseList(node!)!)")
//node = inputList([1,2,3,4,5]) // 因为上面已经反转，node 的next指向了nil，所以这里重新赋值
print("\n递归反转单链表:\n \(reverseList3(node!)!)")





