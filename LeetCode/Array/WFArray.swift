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
        var temp = array
        
        for index in 0...array.count {
            if index == 2{
                temp.insert(2, at: 2)
                start = true
            }else{
                if start{
                    count += 1
                    if count == 3{
                        temp.insert(2, at: index)
                        count = 0
                    }
                }
            }
        }
        return temp
    }
}
