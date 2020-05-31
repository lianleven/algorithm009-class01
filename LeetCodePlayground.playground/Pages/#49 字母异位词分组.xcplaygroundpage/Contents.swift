//: [Previous](@previous)

class Solution {
    //时间都在四十几

    //以下是以字符串中字符的有序数组作为键值的情况
    func groupAnagrams_2(_ strs:[String])->[[String]]{
        var res:[[String]]=[]
        if strs.isEmpty{return res}
        //需要用一个[[Character]:[Int]]结构来存储，键为某种字符串的字符排序数组，值为该键下的异构字符串在原数据中的下标
        var arr:[[Character]:[Int]]=[:]
        for i in 0..<strs.count{
            var tmp=strs[i].sorted()
            if arr[tmp] == nil{
                arr.updateValue([i],forKey:tmp)
            }
            else{
                arr[tmp]!.append(i)
            }
        }
        for (k,v) in arr{
            var t:[String]=[]
            for j in v{
                t.append(strs[j])
            }
            res.append(t)
        }
        return res
    }

    //以下是用字符及其计数作为键值的情况
    func cntCh(_ str:String)->[Character:Int]{
        var res:[Character:Int]=[:]
        for i in str{
            if res[i] != nil{
                res[i]!+=1
            }
            else{
                res.updateValue(1,forKey:i)
            }
        }
        return res
    }
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res:[[String]]=[[String]]()
        if strs.isEmpty{return res}
        //用一个[[Character:Int]:[Int]]结构来存储一个键为各个字符的数目、值为符合该条件的字符串在原数据中的下标
        var t:[[Character:Int]:[Int]]=[:]
        for i in 0..<strs.count{
            let m=cntCh(strs[i])
            if t[m] == nil{
                t.updateValue([i],forKey:m)
            }
            else{
                t[m]!.append(i)
            }
        }
        //print(t)
        for (_,v) in t{
            var arr:[String]=[]
            for i in v{
                arr.append(strs[i])
            }
            res.append(arr)
        }
        //print(res)
        return res
    }
}
