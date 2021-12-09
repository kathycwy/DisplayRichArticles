//
//  webNSParaViewController.swift
//  DisplayRichArticles
//
//  Created by Fengwu Lu on 07.12.21.
//

import UIKit

class webNSParaViewController: UIViewController {

    @IBOutlet weak var astaNSParagraphTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       setTextView(textviewContent: getHTMLContent(), targetTextView: astaNSParagraphTextView)
        astaNSParagraphTextView.isEditable = false
        astaNSParagraphTextView.isSelectable = true
        // Do any additional setup after loading the view.
    }
    
    func getHTMLContent() -> NSAttributedString{
        if let url = URL(string: "https://www.asta.rwth-aachen.de/corona/"){
            do {
                let htmlSourceCode = try String(contentsOf: url)
                let contentData = Data(htmlSourceCode.utf8)
                let text = try! NSAttributedString(data: contentData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                return text
            } catch {
               
            }
        }
        return NSAttributedString(string: "This content can not be loaded!")
    }
    
    func setNSParagrahStyle() -> NSParagraphStyle{
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.firstLineHeadIndent = 5.0
        paragraphStyle.lineHeightMultiple = 0.85
        paragraphStyle.maximumLineHeight = 0
        paragraphStyle.minimumLineHeight = 0
        paragraphStyle.lineSpacing = 3
        
        paragraphStyle.paragraphSpacing = 20
        paragraphStyle.paragraphSpacingBefore = 10
        
        paragraphStyle.firstLineHeadIndent = 10
        paragraphStyle.headIndent = 5
        paragraphStyle.tailIndent = -5
        
        return paragraphStyle
    }
    func setTextView(textviewContent: NSAttributedString,targetTextView: UITextView){
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: setNSParagrahStyle(),
        ]
        let output = NSMutableAttributedString(attributedString: textviewContent)
        output.addAttributes(attributes, range: NSMakeRange(0, output.length))
        targetTextView.attributedText = output
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
