//
//  webCombViewController.swift
//  DisplayRichArticles
//
//  Created by Fengwu Lu on 07.12.21.
//

import UIKit

class webCombViewController: UIViewController {

    @IBOutlet weak var astaNSCombTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getHTMLContent()
        astaNSCombTextView.isEditable = false
        astaNSCombTextView.isSelectable = true
        // Do any additional setup after loading the view.
    }
    func getHTMLContent(){
      
        if let url = URL(string: "https://www.asta.rwth-aachen.de/corona/"){
            do {
                let htmlSourceCode = try String(contentsOf: url)
                let contentData = Data(htmlSourceCode.utf8)
                let text = try? NSAttributedString(data: contentData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                self.astaNSCombTextView.attributedText = text
               
            } catch {
                self.astaNSCombTextView.text = "This Content can not be loaded"
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

}
