//
//  WKWebViewController.swift
//  DisplayRichArticles
//
//  Created by Yash Joshi on 03.12.21.
//

import UIKit
import WebKit
class WKWebViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func websiteTapped(_ sender: Any) {
        print("something")
        guard let url = URL(string:"https://hci.rwth-aachen.de/") else {
            return
        }
        let title : String = ""
        let vc = WKWebViewWebsiteController(url : url,title: title)
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
    @IBAction func localHTMLTapped(_ sender: Any) {
        print("localhtmltapped")
            let vc = WKWebViewCustomController(decisionVariable : 1)
            let navVC = UINavigationController(rootViewController: vc)
            present(navVC,animated: true)
        }
        
    @IBAction func customElementTapped(_ sender: Any) {
        let vc = WKWebViewCustomController(decisionVariable : 0)
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC,animated: true)
        }
}
