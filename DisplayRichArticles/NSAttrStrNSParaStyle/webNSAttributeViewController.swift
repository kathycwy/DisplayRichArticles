//
//  webNSAttributeViewController.swift
//  DisplayRichArticles
//
//  Created by Fengwu Lu on 07.12.21.
//

import UIKit

class webNSAttributeViewController: UIViewController {

    @IBOutlet weak var astaNSAttributeTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       setTextView(textviewContent: getHTMLContent(), targetTextView: astaNSAttributeTextView)
        astaNSAttributeTextView.isEditable = false
        astaNSAttributeTextView.isSelectable = true
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
    
    func getRange(attributedString: String, substr: String) -> NSRange {
        return (attributedString as NSString).range(of: substr)
    }
    
    func setAttribute(attributedText: NSMutableAttributedString, targetStr: String, attrs: [NSAttributedString.Key : Any] = [:]) -> NSMutableAttributedString {
        let inputLength = attributedText.string.count
        var range = NSRange(location: 0, length: attributedText.length)
        while (range.location != NSNotFound) {
            range = (attributedText.string as NSString).range(of: targetStr, range: range)
            if (range.location != NSNotFound) {
                attributedText.addAttributes(attrs, range: range)
                range = NSRange(location: range.location + range.length, length: inputLength - (range.location + range.length))
            }
        }
        return attributedText
    }
    func setTextView(textviewContent: NSAttributedString, targetTextView: UITextView){
        var attributedString = NSMutableAttributedString(attributedString: textviewContent)
//        define attributes
        let default_attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18),
        ]
        let title_attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 36),
            .foregroundColor: UIColor.red
        ]
//        set attributes
        attributedString.addAttributes(default_attributes, range: NSMakeRange(0, attributedString.length))
        attributedString = setAttribute(attributedText: attributedString, targetStr: "Freiversuchsregelung",
                                      attrs: title_attributes)
        attributedString = setAttribute(attributedText: attributedString, targetStr: "Impfung", attrs:
                                            [.font: UIFont.italicSystemFont(ofSize: 30),
                                             .foregroundColor: UIColor.blue
                                                                                                           ])
        
        targetTextView.attributedText = attributedString
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
