//
//  NSAttrStringViewController.swift
//  DisplayRichArticles
//
//  This view controller controls the two pages for demostrating the general use of NSAttributedString
//
//

import UIKit

class NSAttrStringViewController: UIViewController, UITabBarControllerDelegate, UINavigationControllerDelegate {

    
    let appRedColor = UIColor(red: 230.0/255.0, green: 51.0/255.0, blue: 49.0/255.0, alpha: 1.0)
    let appBlueColor = UIColor(red: 62.0/255.0, green: 62.0/255.0, blue: 145.0/255.0, alpha: 1.0)
    let appYellowColor = UIColor(red: 218.0/255.0, green: 175.0/255.0, blue: 0.0, alpha: 1.0)
    let darkOrangeColor = UIColor(red: 218.0/255.0, green: 150.0/255.0, blue: 75.0/255.0, alpha: 1.0)
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var htmlLabel: UILabel!
    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var urlLabel: UITextView!
    
    @IBOutlet weak var nsAttrStrTextView: UITextView!
    
    @IBOutlet weak var detailButton: UIBarButtonItem!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if (nsAttrStrTextView != nil){
            self.setNsAttrStrTextView()
        }
        if (firstLabel != nil){
            self.setFirstLabel()
            self.setSecondLabel()
            self.setThirdLabel()
            self.setFourthLabel()
            self.setHtmlLabel()
            self.setImageLabel()
        }
    
    }
    
    @objc func showDetail(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (nsAttrStrTextView != nil){
            self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "More Examples", style: .done, target: self, action: #selector(showDetail))
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (self.tabBarController?.navigationItem.rightBarButtonItem != nil){
            self.tabBarController?.navigationItem.rightBarButtonItem = nil
        }
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
    
    // MARK: Sample code shown in PPT
    //
    
    func setLabelText() {
        let text = "Hello! ByeBye!"
        let font = UIFont.systemFont(ofSize: 14)
        
        // Step 1. Set attributes that you want to apply
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.red
        ]
        
        // Step 2. Create attributed text
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        
        // Step 3. Display the text
        self.myLabel.attributedText = attributedText
    }
    
    func setLabelText2() {
        let text = "Hello! ByeBye!"
        let font = UIFont.systemFont(ofSize: 14)
        
        // Step 1. Set attributes that you want to apply
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.red
        ]
        
        // Step 2. Create attributed text
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)

        // Step 3a. Add attibute for "!"
        // Note:
        //     * The default addAttribute function will only apply the attribute to the FIRST matched one
        //       Therefore, if there are more then one "!" in the string. Only the first "!" will become green
        attributedText.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.green,
            range: getRange(attributedString: text, substr: "!")
        )
        
        // Step 3b. Add multiple attributes for "Bye"
        // Note:
        //     * Same as addAttribute, only applys to the FIRST matched substring
        attributedText.addAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.blue,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)
            ],
            range: getRange(attributedString: text, substr: "Bye")
        )
        
        // Step 4. Display the text
        self.myLabel.attributedText = attributedText
    }
    
    // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //
    // The code below is to add attributes to an articles which shows the difference between plain and attributed string
    //
    // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    // MARK: Demostrate how to add or change attributes for an article
    //
    func setNsAttrStrTextView(){
        
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
        
        // Create and apply attributes for applying to the whole article
        let font = UIFont.systemFont(ofSize: 14)
        
        var attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.label
        ]
        
        var attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        
        // Create shadow attribute
        let shadow : NSShadow = NSShadow()
           shadow.shadowOffset = CGSize(width: -2.0, height: -2.0)
        
        // Apply attibutes to specific sets of string
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: getRange(attributedString: text, substr: "one of the largest research parks in Europe"))
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "(for example, font and kerning)",
                                      attrs:
                                        [.foregroundColor : UIColor.systemBlue,
                                         .font: UIFont.italicSystemFont(ofSize: 14)])
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "(see Attributed String Programming Guide)",
                                      attrs:
                                        [.foregroundColor : UIColor.systemBlue,
                                         .font: UIFont.italicSystemFont(ofSize: 14)])
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "NSParagraphStyle",
                                      attrs:
                                        [.font: UIFont.systemFont(ofSize: 14),
                                         .underlineStyle : 1,
                                         .foregroundColor : UIColor.white,
                                         .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle as NSString,
                                         .strokeWidth : 3.0,
                                         .shadow : shadow])
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "NSMutableParagraphStyle",
                                      attrs:
                                        [.font: UIFont.systemFont(ofSize: 16),
                                         .foregroundColor : UIColor.blue,
                                         .strokeWidth: 2,
                                         .strokeColor: UIColor.magenta])
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "NSAttributedString",
                                      attrs:
                                        [.font: UIFont.systemFont(ofSize: 14),
                                         .foregroundColor : UIColor.blue,
                                         .strokeWidth: 2,
                                         .strokeColor: UIColor.magenta])
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "NSMutableAttributedString",
                                      attrs:
                                        [.font: UIFont.systemFont(ofSize: 14),
                                         .foregroundColor : UIColor.red])
        
        // Apply same attibutes to multiple sets of string
        attributes = [
            .font: UIFont.boldSystemFont(ofSize: 18),
            .underlineStyle : 1,
            .foregroundColor : UIColor.gray,
            .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle as NSString,
            .strokeWidth : 3.0,
            .shadow : shadow
        ]
        attributedText.addAttributes( attributes,
                                      range: getRange(attributedString: text, substr: "NSAttributedString"))
        attributedText.addAttributes(attributes,
                                     range: getRange(attributedString: text, substr: "Declaration"))
        attributedText.addAttributes(attributes,
                                     range: getRange(attributedString: text, substr: "Overview"))
        
        attributedText = setAttribute(attributedText: attributedText, targetStr: "class NSAttributedString : NSObject",
                                      attrs:
                                        [.font: UIFont(name: "Courier-Bold", size: 14)!,
                                         .backgroundColor: UIColor.darkGray,
                                         .foregroundColor: UIColor.white,
                                         .strokeWidth: 0])
        self.nsAttrStrTextView.attributedText = attributedText
        self.nsAttrStrTextView.isEditable = false
        self.nsAttrStrTextView.isSelectable = false
    }
    // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //
    // The code below is for "More Example" page which introduces how we can use NSAttributedString for different purposes
    //
    // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    // MARK: Sample 1 -  Setting text attributes (fonts, colours, underline, strokes, shaddow, etc)
    //
    
    // 1.1: Changing font colour
    func setFirstLabel() {
        self.firstLabel.numberOfLines = 0
        let text = "Colourful background"
        let font = UIFont.systemFont(ofSize: 21)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        attributedText.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.red,
            range: getRange(attributedString: text, substr: "Co")
        )
        attributedText.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.cyan,
            range: getRange(attributedString: text, substr: "lo")
        )
        attributedText.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.blue,
            range: getRange(attributedString: text, substr: "ur")
        )
        attributedText.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.orange,
            range: getRange(attributedString: text, substr: "ful")
        )
        attributedText.addAttribute(
            NSAttributedString.Key.backgroundColor,
            value: UIColor.orange,
            range: getRange(attributedString: text, substr: "background")
        )
        
        self.firstLabel.attributedText = attributedText
    }
    
    // 1.2: Changing font emphasis (Bold, Italic, etc)
    func setSecondLabel() {
        self.secondLabel.numberOfLines = 0
        let text = "Bold Italic BoldItalic CondensedBlack"
        let font = UIFont.systemFont(ofSize: 21)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.blue
        ]
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        attributedText.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.boldSystemFont(ofSize: 21),
            range: getRange(attributedString: text, substr: "Bold")
        )
        attributedText.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.italicSystemFont(ofSize: 21),
            range: getRange(attributedString: text, substr: "Italic")
        )
        attributedText.addAttribute(
            NSAttributedString.Key.font,
            value:UIFont(name: "HelveticaNeue-BoldItalic", size: 20)!,
            range: getRange(attributedString: text, substr: "BoldItalic")
        )
        attributedText.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)!,
            range: getRange(attributedString: text, substr: "CondensedBlack")
        )
        self.secondLabel.attributedText = attributedText
    }
    
    // 1.3: Changing font emphasis (underline, strick-through)
    func setThirdLabel() {
        self.thirdLabel.numberOfLines = 0
        let text = "underline, double-underline, DashDotDot, strick-through textraised"
        let font = UIFont.systemFont(ofSize: 21)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.purple
        ]
        
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        
        attributedText.addAttributes(
            [
                NSAttributedString.Key.underlineStyle: 1,
                NSAttributedString.Key.underlineColor: UIColor.brown
            ],
            range: getRange(attributedString: text, substr: "underline")
        )
        attributedText.addAttributes(
            [
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.double.rawValue,
                NSAttributedString.Key.underlineColor: UIColor.red
            ],
            range: getRange(attributedString: text, substr: "double-underline")
        )
        attributedText.addAttributes(
            [
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.patternDashDotDot.rawValue,
                NSAttributedString.Key.underlineColor: UIColor.green
            ],
            range: getRange(attributedString: text, substr: "DashDotDot")
        )
        attributedText.addAttributes(
            [
                NSAttributedString.Key.underlineStyle: 20,
                NSAttributedString.Key.underlineColor: UIColor.brown
            ],
            range: getRange(attributedString: text, substr: "text")
        )
        attributedText.addAttributes(
            [
                NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.thick.rawValue,
                NSAttributedString.Key.strikethroughColor: UIColor.brown
            ],
            range: getRange(attributedString: text, substr: "strick-through")
        )
        attributedText.addAttribute(
            NSAttributedString.Key.baselineOffset,
            value: 10,
            range: getRange(attributedString: text, substr: "raised")
        )
        self.thirdLabel.attributedText = attributedText
    }
    
    // 1.4: Changing text style with shadow and stroke
    func setFourthLabel() {
        self.fourthLabel.numberOfLines = 0
        let text = "shadow, stroke"
        let font = UIFont.systemFont(ofSize: 21)
        
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 4.0, height: 4.0)
        shadow.shadowColor = UIColor.black
        shadow.shadowBlurRadius = 4.0
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        attributedText.addAttribute(
            NSAttributedString.Key.shadow,
            value: shadow,
            range: getRange(attributedString: text, substr: "shadow")
        )
        attributedText.addAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.gray,
                NSAttributedString.Key.strokeWidth : 3.0
            ],
            range: getRange(attributedString: text, substr: "stroke")
        )
        self.fourthLabel.attributedText = attributedText
    }
    
    //
    // MARK: Sample 2 -  Displaying images using attributed string in UILabel / UITextView
    //                -  Creating UITextView with a clickable link
    //
    func setImageLabel() {
        
        // Attach an image as a text attachment
        let textAttachment = NSTextAttachment()
        textAttachment.image = UIImage(named: "xmas.jpg")
        let imageOffsetY: CGFloat = -15.0
        textAttachment.bounds = CGRect(x: 0, y: imageOffsetY,
                                       width: textAttachment.image!.size.width,
                                       height: textAttachment.image!.size.height)
        
        // Convert the text attachment as attributed String
        var attributedText = NSAttributedString(attachment: textAttachment)
        
        // Display the attributed string in the UILabel
        self.imageLabel.attributedText = attributedText
        
        // Set the hyperlink for the source of the image to a UITextView
        let text = "Here is the link of the image"
        let font = UIFont.systemFont(ofSize: 15)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .link: "https://pixabay.com/illustrations/christmas-gifts-snow-surprise-3030279/"
        ]
        
        attributedText = NSAttributedString(string: text, attributes: attributes)
        self.urlLabel.attributedText = attributedText
    }
    
    //
    // MARK: Sample 3 -  Displaying HTML using attributed string in UILabel / UITextView
    //
    func setHtmlLabel() {
        // Allow multiple lines
        self.htmlLabel.numberOfLines = 0
        
        // Prepare HTML string
        let htmlString = """
            <!DOCTYPE html>
            <html>
            <body>
            <h1 style="background-color:DodgerBlue;">Hello!</h1>
            <h3>This is</h3>
            <h2 style="margin: 50px;">a demo text</h2>
            <h3 style="padding: 30px;">created using</h3>
            <h1 style="background-color:Tomato;">HTML!!</h1>
            <h1 style="border:2px solid Violet;">Hello World</h1>
            </body>
            </html>
        """
        
        // Try to convert the string into a Data instance using Unicode encoding
        guard let data = htmlString.data(using: String.Encoding.utf8)
                          else { fatalError("incorrect htmlString") }
        
        // Try to load the Data instance as an HTML type
        let attributedText = try! NSMutableAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        )
        
        // Display the attributed string in the UILabel
        self.htmlLabel.attributedText = attributedText
    }
    
    
    // MARK: UITextView Delegate Method
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {

       if (URL.absoluteString == "Here is the link of the image") {
             let objVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NSAttrStringViewController") as! NSAttrStringViewController
             self.navigationController?.pushViewController(objVC, animated: true)
        }
        return true
    }
}
