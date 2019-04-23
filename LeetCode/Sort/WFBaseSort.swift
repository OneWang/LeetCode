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
//Time Complexity: O(n), Space Complexity: O(1)
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
//Time Complexity: O(n), Space Complexity: O(1)
class SortColors {
    func sortColors(_ nums: inout [Int]) {
        var red = 0, blue = nums.count - 1, i = 0
        
        while i <= blue {
            if nums[i] == 0 {
                _swap(&nums, i, red)
                red += 1
                i += 1
            } else if nums[i] == 1 {
                i += 1
            } else {
                _swap(&nums, i, blue)
                blue -= 1
            }
        }
    }
    //private 访问级别所修饰的属性或者方法只能在当前类里访问
    //fileprivate 访问级别所修饰的属性或者方法在当前的 Swift 源文件里可以访问
    fileprivate func _swap<T>(_ nums: inout [T], _ p: Int, _ q: Int) {
        (nums[p], nums[q]) = (nums[q], nums[p])
    }
}

/**
 * Time Complexity: O(n), Space Complexity: O(1)
    迭代数组并将最大的数组交换到中间
 guard语句和if语句有点类似，都是根据其关键字之后的表达式的布尔值决定下一步执行什么。但与if语句不同的是，guard语句只会有一个代码块，不像if语句可以if else多个代码块。
 那么guard语句的作用到底是什么呢？顾名思义，就是守护。guard语句判断其后的表达式布尔值为false时，才会执行之后代码块里的代码，如果为true，则跳过整个guard语句，
 
 摆动排序
 Primary idea: Sort and re-arrange the array
 Time Complexity: O(nlogn), Space Complexity: O(n)
 */

class WiggleSort {
    func wiggleSort(_ nums: inout [Int]) {
        guard nums.count >= 2 else {
            return
        }
        
        for i in stride(from: 1, to: nums.count, by: 2) {
            let idx = getLargest(nums, i - 1, i , i + 1)
            (nums[i], nums[idx]) = (nums[idx], nums[i])
        }
    }
    
    private func getLargest(_ nums: [Int], _ x: Int, _ y: Int, _ z: Int) -> Int {
        let len = nums.count
        let xVal = x >= 0 && x < len ? nums[x] : Int.min
        let yVal = y >= 0 && y < len ? nums[y] : Int.min
        let zVal = z >= 0 && z < len ? nums[z] : Int.min
        let maxVal = max(xVal, yVal, zVal)
        if maxVal == xVal {
            return x
        } else if maxVal == yVal {
            return y
        } else {
            return z
        }
    }
}

class WiggleSortII {
    func wiggleSort(_ nums: inout [Int]) {
        let temp = nums.sorted()
        
        var m = temp.count
        var n = (m + 1) / 2
        
        for i in 0..<nums.count {
            if i & 1 == 0 {
                n = n - 1
                nums[i] = temp[n]
            } else {
                m = m - 1
                nums[i] = temp[m]
            }
        }
    }
}
