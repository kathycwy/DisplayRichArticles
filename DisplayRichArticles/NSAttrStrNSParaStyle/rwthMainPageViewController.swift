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
        pageView.attributedText = getHTMLContent()
        pageView.isEditable = false
        pageView.isSelectable = true
    }
    //get target HTML Content from URL and convert to NSAttributedString
    func getHTMLContent() -> NSAttributedString{
        guard let url = URL(string: "https://www.asta.rwth-aachen.de/en/corona-faq/")
                            else { fatalError("incorrect url content") }
        do
        {
            let htmlSourceCode = try String(contentsOf: url)
            let contentData = Data(htmlSourceCode.utf8)
            let text = try! NSAttributedString(
                data: contentData,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )
            return text
        }
        catch{
            
        }
        return NSAttributedString(string: "This content can not be loaded!")
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


