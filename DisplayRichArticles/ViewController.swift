//
//  ViewController.swift
//  DisplayRichArticles
//
//  Created by C Chan on 18/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nsParaStyleButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToMain(unwindSegue : UIStoryboardSegue){
    }
    
    @IBAction func didTapButton() {
        let nsAttrStr_vc = storyboard?.instantiateViewController(withIdentifier: "nsAttrStr_vc") as! NSAttrStringViewController
        present(nsAttrStr_vc, animated: true)
        let nsParaStyle_vc = storyboard?.instantiateViewController(withIdentifier: "nsParaStyle_vc") as! NSParaStyleViewController
        present(nsParaStyle_vc, animated: true)
        let nsTextKit_vc = storyboard?.instantiateViewController(withIdentifier: "nsTextKit_vc") as! NSTextkitViewController
        present(nsTextKit_vc, animated: true)
    }
    
}

