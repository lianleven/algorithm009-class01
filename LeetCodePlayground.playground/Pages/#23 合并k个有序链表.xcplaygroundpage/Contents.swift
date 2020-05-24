
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

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 {
        return nil
    }
    if lists.count == 1 {
        return lists.first as? ListNode
    }
    if lists.count == 2 {
        return mergeTwoLists(lists.first as? ListNode,lists.last as? ListNode)
    }
    let mid = lists.count / 2 // 2分
    var l1s: [ListNode?] = []
    var l2s: [ListNode?] = []
    for i in 0..<mid {
        l1s.append(lists[i])
    }
    for i in mid..<lists.count {
        l2s.append(lists[i])
    }
    
    return mergeTwoLists(mergeKLists(l1s),mergeKLists(l2s))
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


print(mergeKLists([inputList([1,2,3]),inputList([1,2,3]),inputList([1,2,3]),inputList([1,2,3])])!)

