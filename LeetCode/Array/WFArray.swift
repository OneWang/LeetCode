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
