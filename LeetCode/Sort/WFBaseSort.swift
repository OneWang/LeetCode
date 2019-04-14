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
        var temp = Array<Int>()
        
        for index in array {
            print("\(index)")
            temp.append(index)
        }
        return temp
    }
}
