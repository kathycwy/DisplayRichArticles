//
//  NSParaStyleViewController.swift
//  DisplayRichArticles
//
//  Created by C Chan on 18/11/2021.
//

import UIKit

class NSParaStyleViewController: UIViewController {

    @IBOutlet weak var nsParaStyleTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNsParaStyleTextView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func setNsParaStyleTextView(){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.firstLineHeadIndent = 5.0
        paragraphStyle.lineHeightMultiple = 0.85
        paragraphStyle.maximumLineHeight = 0
        paragraphStyle.minimumLineHeight = 0
        paragraphStyle.lineSpacing = 5
        
        paragraphStyle.paragraphSpacing = 10
        paragraphStyle.paragraphSpacingBefore = 10
        
        paragraphStyle.firstLineHeadIndent = 10
        paragraphStyle.headIndent = 5
        paragraphStyle.tailIndent = -5
        
        let font = UIFont.systemFont(ofSize: 14)
        let text = """
NSAttributedString
A string with associated attributes (such as visual style, hyperlinks, or accessibility data) for portions of its text.
Declaration
class NSAttributedString : NSObject
Overview
An NSAttributedString object manages character strings and associated sets of attributes (for example, font and kerning) that apply to individual characters or ranges of characters in the string. An association of characters and their attributes is called an attributed string. The cluster’s two public classes, NSAttributedString and NSMutableAttributedString, declare the programmatic interface for read-only attributed strings and modifiable attributed strings, respectively.

An attributed string identifies attributes by name, using an NSDictionary object to store a value under the specified name. You can assign any attribute name/value pair you wish to a range of characters—it is up to your application to interpret custom attributes (see Attributed String Programming Guide). If you are using attributed strings with the Core Text framework, you can also use the attribute keys defined by that framework.

You use attributed strings with any APIs that accept them, such as Core Text. The AppKit and UIKit frameworks also provide a subclass of NSMutableAttributedString, called NSTextStorage, to provide the storage for the extended text-handling system. In iOS 6 and later you can use attributed strings to display formatted text in text views, text fields, and some other controls. Both AppKit and UIKit also define extensions to the basic attributed string interface that allows you to draw their contents in the current graphic context.

The default font for NSAttributedString objects is Helvetica 12-point, which may differ from the default system font for the platform. Thus, you might want to create new strings with non-default attributes suitable for your application. You can also use the NSParagraphStyle class and its subclass NSMutableParagraphStyle to encapsulate the paragraph or ruler attributes used by the NSAttributedString classes.

Be aware that comparisons of NSAttributedString objects using the isEqual(_:) method look for exact equality. The comparison includes both a character-by-character string equality check and an equality check of all attributes. Such a comparison is not likely to yield a match if the string has many attributes, such as attachments, lists, and tables, for example.

The NSAttributedString class is “toll-free bridged” with its Core Foundation counterpart, CFAttributedString. See Toll-Free Bridging for more information.
"""
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .paragraphStyle: paragraphStyle
        ]
        
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        
        /*
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadow.shadowColor = UIColor.black
        shadow.shadowBlurRadius = 2.0
         
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: getRange(attributedString: text, substr: "one of the largest research parks in Europe"))
        
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "(for example, font and kerning)",
                                      attrs:
                                        [.foregroundColor : UIColor.cyan])
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "(see Attributed String Programming Guide)",
                                      attrs:
                                        [.foregroundColor : UIColor.cyan])
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "NSParagraphStyle",
                                      attrs:
                                        [.font: UIFont.systemFont(ofSize: 16),
                                         .foregroundColor : UIColor.blue,
                                         .strokeWidth: 2,
                                         .strokeColor: UIColor.magenta])
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "NSMutableParagraphStyle",
                                      attrs:
                                        [.font: UIFont.systemFont(ofSize: 16),
                                         .foregroundColor : UIColor.blue,
                                         .strokeWidth: 2,
                                         .strokeColor: UIColor.magenta])
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "NSAttributedString",
                                      attrs:
                                        [.font: UIFont.systemFont(ofSize: 16),
                                         .foregroundColor : UIColor.blue,
                                         .strokeWidth: 2,
                                         .strokeColor: UIColor.magenta])
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "NSMutableAttributedString",
                                      attrs:
                                        [.font: UIFont.systemFont(ofSize: 16),
                                         .foregroundColor : UIColor.red,
                                         .strikethroughStyle: NSUnderlineStyle.thick.rawValue])
        
        attributedText.addAttributes([.font: UIFont.boldSystemFont(ofSize: 18),
                                      .underlineStyle: NSUnderlineStyle.thick.rawValue,
                                      .shadow: shadow,
                                      .strokeWidth: 0,
                                      .foregroundColor: UIColor.magenta], range: getRange(attributedString: text, substr: "NSAttributedString"))
        attributedText.addAttributes([.font: UIFont.boldSystemFont(ofSize: 18),
                                      .underlineStyle: NSUnderlineStyle.thick.rawValue,
                                      .shadow: shadow,
                                      .foregroundColor: UIColor.magenta], range: getRange(attributedString: text, substr: "Declaration"))
        attributedText.addAttributes([.font: UIFont.boldSystemFont(ofSize: 18),
                                      .underlineStyle: NSUnderlineStyle.thick.rawValue,
                                      .shadow: shadow,
                                      .foregroundColor: UIColor.magenta], range: getRange(attributedString: text, substr: "Overview"))
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "class NSAttributedString : NSObject",
                                      attrs:
                                        [.font: UIFont.boldSystemFont(ofSize: 14),
                                         .backgroundColor: UIColor.yellow,
                                         .strokeWidth: 0,
                                         .foregroundColor: UIColor.blue])
        */
        self.nsParaStyleTextView.attributedText = attributedText
        self.nsParaStyleTextView.isEditable = false
        self.nsParaStyleTextView.isSelectable = false
    }
}

