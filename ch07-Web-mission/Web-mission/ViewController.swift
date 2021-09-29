//
//  ViewController.swift
//  Web-mission
//
//  Created by dev on 2021/09/29.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet var mainWebview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let filePath = Bundle.main.path(forResource: "workFlowy", ofType: "html")
        let url = URL(fileURLWithPath: filePath!)
        let urlRequest = URLRequest(url: url)
        mainWebview.load(urlRequest)
    }


}

