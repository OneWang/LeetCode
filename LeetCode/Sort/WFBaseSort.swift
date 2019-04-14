//
//  WFBaseSort.swift
//  LeetCode
//
//  Created by Jack on 2019/4/14.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class WFBaseSort: NSObject {
    static func bubbleSort(array : Array<Int>) -> Array<Int>  {
        var arr = array
        arr = arr.sorted()
        var temp = Array<Int>()
        for index in array {
            print("\(index)")
            temp.append(index)
        }
        return temp
    }
}

class ArrayPartitionI {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var arr = nums
        arr = arr.sorted()
        var res = 0
        for i in 0..<arr.count {
            if i & 1 != 0 {
                res += min(arr[i], arr[i - 1])
            }
        }
        return res
    }
}

class ArrayPartitionI_2 {
    func arrayPairSum(_ nums: [Int]) -> Int {
        return nums.sorted(by: <).enumerated()
            .compactMap { $0 % 2 == 0 ? $1 : nil }
            .reduce(0) { $0 + $1 }
    }
}

