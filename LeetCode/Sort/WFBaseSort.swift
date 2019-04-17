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

///561.数组的拆分
/**
 按位与，由于位运算直接对内存数据进行操作，不需要转成十进制，因此处理速度非常快；
 1.奇偶性判断
 一个整数a, a & 1 这个表达式可以用来判断a的奇偶性。二进制的末位为0表示偶数，最末位为1表示奇数;
 2.判断n是否是2的正整数冪
 (!(n&(n-1)) )&& n
 3.对于正整数的模运算
 乘除法是很消耗时间的，只要对数左移一位就是乘以2，右移一位就是除以2，传说用位运算效率提高了60%。
 乘2^k众所周知： n<<k。
 */
///给定长度为 2n 的数组, 你的任务是将这些数分成 n 对, 例如 (a1, b1), (a2, b2), ..., (an, bn) ，使得从1 到 n 的 min(ai, bi) 总和最大。
//思路：由于数组是长度是确定的，所以构成的对数也是确定，我们将会取得数组的一半。先将数组进行升序排序，我们取出所有偶数下标（从0开始）的和即可。
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
    
    func arrayPairSum1(_ nums: [Int]) -> Int {
        var arr = nums
        arr = arr.sorted()
        var res = 0
        for i in 0..<arr.count {
            if i & 1 == 0 {
                res += arr[i]
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

///88.合并两个有序数组
//从最后一个开始比较插入
class Solution {
    func mergeSortArray(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1
        
        while i >= 0 || j >= 0 {
            if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
                nums1[i + j + 1] = nums1[i]
                i -= 1
            } else {
                nums1[i + j + 1] = nums2[j]
                j -= 1
            }
        }
    }
}

//57.给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
//此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
