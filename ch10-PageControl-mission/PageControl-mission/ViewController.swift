//
//  ViewController.swift
//  PageControl-mission
//
//  Created by dev on 2021/10/03.
//

import UIKit

class ViewController: UIViewController {
    var numbers = Array(1...10)
    
    @IBOutlet var lblNumber: UILabel!
    @IBOutlet var pageContorl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageContorl.numberOfPages = numbers.count
        pageContorl.currentPage = 0
        pageContorl.pageIndicatorTintColor = UIColor.green
        pageContorl.currentPageIndicatorTintColor = UIColor.red
        lblNumber.text = String(numbers[0])
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        lblNumber.text = String(numbers[pageContorl.currentPage])
    }
    
}

