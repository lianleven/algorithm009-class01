
/** leetcode 24
 
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 
 
 
 示例:
 
 给定 1->2->3->4, 你应该返回 2->1->4->3.
 
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

func swapPairs(_ head: ListNode?) -> ListNode? {
    let newHead = ListNode(0)
    newHead.next = head;
    var cur = newHead
    while cur.next != nil && cur.next?.next != nil {
        let n1 = cur.next
        let n2 = cur.next?.next
        cur.next = n2
        n1?.next = n2?.next
        n2?.next = n1
        cur = n1!
    }
    return newHead.next
}

var node = inputList([1,2,3,4,5])
print("\n单链表:\n \(node!)")
print("交换之后的链表: \(swapPairs(node!)!)")

