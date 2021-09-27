//
//  ViewController.swift
//  ImageView-mission
//
//  Created by dev on 2021/09/27.
//

import UIKit

class ViewController: UIViewController {
    var imgNumber: Int = 1
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image = UIImage(named: "\(imgNumber).png")
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        imgNumber = imgNumber == 1 ? 1 : imgNumber-1
        imgView.image = UIImage(named: "\(imgNumber).png")
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        imgNumber = imgNumber == 6 ? 6 : imgNumber+1
        imgView.image = UIImage(named: "\(imgNumber).png")
    }
    
}

