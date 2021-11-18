//
//  ViewController.swift
//  DisplayRichArticles
//
//  Created by C Chan on 18/11/2021.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToMain(unwindSegue : UIStoryboardSegue){
    }
    
    @IBAction func didTapButton() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "nsAttrStr_vc") as! NSAttrStringViewController
        present(vc, animated: true)
    }

}

