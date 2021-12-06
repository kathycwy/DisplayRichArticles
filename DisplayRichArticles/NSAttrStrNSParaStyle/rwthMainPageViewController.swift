//
//  rwthMainPageViewController.swift
//  DisplayRichArticles
//
//  Created by Fengwu Lu on 05.12.21.
//

import UIKit
import WebKit

class rwthMainPageViewController: UIViewController {

    @IBOutlet weak var pageView: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getHTMLContent()
        //pageView.text = getHTMLContent()
        //pageView.isEditable = false
        //pageView.isSelectable = true
        // Do any additional setup after loading the view.
    }
    
    func getHTMLContent(){
        if let url = URL(string: "https://www.rwth-aachen.de"){
            do {
                let htmlSourceCode = try String(contentsOf: url)
                let contentData = Data(htmlSourceCode.utf8)
                let text = try? NSAttributedString(data: contentData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                pageView.attributedText = text
               
            } catch {
               print("This Content can not be loaded")
            }
        }
        
    }
    
    
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


