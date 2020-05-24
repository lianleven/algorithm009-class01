
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


func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    
    var cur = head
    cur?.next = deleteDuplicates(cur?.next)
    
    if cur!.val == cur!.next!.val {
        cur = cur!.next
    }
    
    
    return cur
}

print(deleteDuplicates(inputList([1,1,2,2,3])))
