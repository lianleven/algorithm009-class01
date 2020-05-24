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

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    }
    if l2 == nil {
        return l1
    }
    
    var res: ListNode?
    
    if l1!.val > l2!.val {
        res = l2
        res?.next = mergeTwoLists(l1, l2?.next)
    }else{
        res = l1
        res?.next = mergeTwoLists(l1?.next, l2)
    }
    return res
}
