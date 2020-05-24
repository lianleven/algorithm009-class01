
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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    if head == nil || n <= 0 {
        return head
    }
    var low = head
    var fast = head
    var count = 0
    while fast?.next != nil {
        count += 1
        if count <= n {
            fast = fast?.next
        }else{
            low = low?.next
            fast = fast?.next
        }
    }
    if head?.next == nil || count + 1 == n {
        return head?.next
    }
    low?.next = low?.next?.next
    return head
}
var node = inputList([1,2,3,4,5])
print(removeNthFromEnd(node,2)!)
