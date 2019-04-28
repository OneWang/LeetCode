//
//  ViewController.swift
//  LeetCode
//
//  Created by Jack on 2019/4/11.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let test = WFBaseSort()
//        print("\(test.bubbleSort(array: [5,2,9,1,7,3]))")
//        print("\(WFBaseSort.bubbleSort(array: [3,4,1,6]))")
        
//        print("\(2 << 4)")
        
//        let test = ArrayPartitionI()
//        print("\(test.arrayPairSum1([1,4,3,2]))")
        
        var array = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
        let test1 = WFArray()
        print("\(test1.insertArray(array: &array))")
        
        let array1 = [1,3,12,4,24,34,11,2,2,3]
        let test = TopKFrequentElements()
        print("\(test.topKFrequent(nums: array1, 2))")
        
        ///块便利
        for (index,num) in array1.enumerated() {
            print("\(index)====\(num)")
        }
        
    }
}

