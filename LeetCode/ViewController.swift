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
    }

    func bubbleSort(array : Array<Int>) -> Array<Int>  {
        var temp = Array<Int>()
        for index in array {
            print("\(index)")
            temp.append(index)
        }
        return temp
    }
}

