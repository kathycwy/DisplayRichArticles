//
//  UITextView.swift
//  DisplayRichArticles
//
//  Created by Wingyin Chan on 20.11.21.
//

import UIKit

class UITextViewController: UIViewController {
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.size.height);
        scrollView.isScrollEnabled = true
            
        view.addSubview(scrollView)
        
        self.setView()
    }
    
    func setView() {
        
        let itemX = 40
        var itemY = 40
        let itemWidth = Int(self.view.bounds.size.width - 80)
        let itemHeight = 150
        let labelHeight = 18
        let labelTextViewOffset = 25
        let itemY_increment = 220
        
        
        //////////////////////////////////////////////////////////  Basic  //////////////////////////////////////////////////////////
        // UILabel
        let uiLabel_default = UILabel(frame: CGRect(x: itemX, y: itemY, width: itemWidth, height: labelHeight))
        uiLabel_default.text = "Basic UILabel"
        
        // UITextView
        let uiText_default = UITextView()
        uiText_default.frame = CGRect(x: itemX, y: itemY+labelTextViewOffset, width: itemWidth, height: itemHeight)
        uiText_default.text = """
        UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.
        This class supports multiple text styles through use of the attributedText property. (Styled text is not supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
        """
        
        itemY += itemY_increment
        scrollView.addSubview(uiLabel_default)
        scrollView.addSubview(uiText_default)
        

        
        
        //////////////////////////////////////////////////////////  Custom Styles  //////////////////////////////////////////////////////////
        // UILabel
        let uiLabel_customStyles = UILabel(frame: CGRect(x: itemX, y: itemY, width: itemWidth, height: labelHeight))
        uiLabel_customStyles.textColor = UIColor.red
        uiLabel_customStyles.font = UIFont(name: "Bradley Hand Bold", size: 20)
        uiLabel_customStyles.text = "UILabel with custom styles"
        
        // UITextView
        let uiText_customStyles = UITextView()
        uiText_customStyles.frame = CGRect(x: itemX, y: itemY+labelTextViewOffset, width: itemWidth, height: itemHeight)
        uiText_customStyles.layer.borderColor = UIColor.black.cgColor
        uiText_customStyles.layer.borderWidth = 1.0
        uiText_customStyles.layer.cornerRadius = 8
        uiText_customStyles.backgroundColor = UIColor.lightGray
        uiText_customStyles.textColor = UIColor.blue
        uiText_customStyles.font = UIFont(name: "Courier", size: 20)
        uiText_customStyles.textAlignment = NSTextAlignment.center
        uiText_customStyles.text = """
        UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.
        This class supports multiple text styles through use of the attributedText property. (Styled text is not supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
        """
        
        itemY += itemY_increment
        scrollView.addSubview(uiLabel_customStyles)
        scrollView.addSubview(uiText_customStyles)




        //////////////////////////////////////////////////////////  Attributed Text  //////////////////////////////////////////////////////////
        // UILabel
        let uiLabelHtmlString = "<b>UILabel</b> with <u><i>html</i> elements</u>"
        let uiLabelData = uiLabelHtmlString.data(using: .utf8)!
        let uiLabelAttributedString = try? NSAttributedString(
            data: uiLabelData,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        
        let uiLabel_attributedText = UILabel(frame: CGRect(x: itemX, y: itemY, width: itemWidth, height: labelHeight))
        uiLabel_attributedText.attributedText = uiLabelAttributedString
        
        // UITextView
        let uiTextHtmlString = """
        <h3>UITextView supports the display of text using custom style information and also supports text editing.</h3> You typically use a text view to <u>display multiple lines of text</u>, such as when <i>displaying the body of a large text document</i>.
        This class supports multiple text styles through use of the <b>attributedText</b> property. <del>(Styled text is not supported in versions of iOS earlier than iOS 6.)</del> Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
        """
        let uiTextData = uiTextHtmlString.data(using: .utf8)!
        let uiTextAttributedString = try? NSAttributedString(
            data: uiTextData,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        
        let uiText_attributedText = UITextView()
        uiText_attributedText.frame = CGRect(x: itemX, y: itemY+labelTextViewOffset, width: itemWidth, height: itemHeight)
        uiText_attributedText.layer.borderColor = UIColor.lightGray.cgColor
        uiText_attributedText.layer.borderWidth = 1.0
        uiText_attributedText.layer.cornerRadius = 8
        uiText_attributedText.attributedText = uiTextAttributedString
        
        itemY += itemY_increment
        scrollView.addSubview(uiLabel_attributedText)
        scrollView.addSubview(uiText_attributedText)
        
    }

}
