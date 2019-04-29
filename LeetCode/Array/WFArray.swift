//
//  WFArray.swift
//  LeetCode
//
//  Created by Jack on 2019/4/24.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class WFArray: NSObject {
    func insertArray(array : inout [Int]) -> Array<Int> {
        var count = 0
        var start = false
        var insertCount = 0
        
        
        for index in 0...array.count {
            if index == 2{
                array.insert(2, at: 2)
                insertCount += 1
                start = true
            }else{
                if start{
                    count += 1
                    if count == 3{
                        array.insert(2, at: index + insertCount)
                        insertCount += 1
                        count = 0
                        print("\(array)")
                    }
                }
            }
        }
        return array
    }
}

//给定一个非负整数数组 A，返回一个由 A 的所有偶数元素组成的数组，后面跟 A 的所有奇数元素。
class sortArray {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var tempArray = [Int]()
        for (_,num) in A.enumerated() {
            tempArray.insert(num, at: num & 1 == 0 ? 0 : tempArray.count)
        }
        return tempArray
    }
}

//给定一个二进制数组，找出该数组中连续的1的最大数目。
//Time Complexity: O(n), Space Complexity: O(1)
class MaxConsecutiveOnes {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var globalMax = 0, localMax = 0
        for num in nums {
            if num == 1 {
                localMax += 1
                globalMax = max(globalMax, localMax)
            } else {
                localMax = 0
            }
        }
        return globalMax
    }
}
