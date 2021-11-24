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
        
        self.setUITextView()
    }
    
    func setUITextView() {
        
        let itemX = 40
        var itemY = 40
        let itemWidth = Int(self.view.bounds.size.width - 80)
        let itemHeight = 100
        let labelHeight = 18
        let labelTextViewOffset = 25
        let itemY_increment = 160
        
        //Default UITextView
        let uiLabel_default = UILabel(frame: CGRect(x: itemX, y: itemY, width: itemWidth, height: labelHeight))
        uiLabel_default.text = "Default"
        let uiText_default = UITextView()
        uiText_default.frame = CGRect(x: itemX, y: itemY+labelTextViewOffset, width: itemWidth, height: itemHeight)
        uiText_default.text = """
        UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.
        This class supports multiple text styles through use of the attributedText property. (Styled text is not supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
        """
        itemY += itemY_increment
        scrollView.addSubview(uiLabel_default)
        scrollView.addSubview(uiText_default)
        
        
        //UITextView with styled frame
        let uiLabel_styledFrame = UILabel(frame: CGRect(x: itemX, y: itemY, width: itemWidth, height: labelHeight))
        uiLabel_styledFrame.text = "Styled Frame"
        let uiText_styledFrame = UITextView()
        uiText_styledFrame.frame = CGRect(x: itemX, y: itemY+labelTextViewOffset, width: itemWidth, height: itemHeight)
        uiText_styledFrame.layer.borderColor = UIColor.black.cgColor
        uiText_styledFrame.layer.borderWidth = 1.0
        uiText_styledFrame.layer.cornerRadius = 8
        uiText_styledFrame.backgroundColor = UIColor.cyan
        uiText_styledFrame.text = """
        UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.
        This class supports multiple text styles through use of the attributedText property. (Styled text is not supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
        """
        itemY += itemY_increment
        scrollView.addSubview(uiLabel_styledFrame)
        scrollView.addSubview(uiText_styledFrame)
        
        
        //UITextView with styled text
        let uiLabel_styledText = UILabel(frame: CGRect(x: itemX, y: itemY, width: itemWidth, height: labelHeight))
        uiLabel_styledText.text = "Styled Text"
        let uiText_styledText = UITextView()
        uiText_styledText.frame = CGRect(x: itemX, y: itemY+labelTextViewOffset, width: itemWidth, height: itemHeight)
        uiText_styledText.layer.borderColor = UIColor.lightGray.cgColor
        uiText_styledText.layer.borderWidth = 1.0
        uiText_styledText.layer.cornerRadius = 8
        uiText_styledText.textColor = UIColor.blue
        uiText_styledText.font = UIFont(name: "Courier", size: 20)
        uiText_styledText.textAlignment = NSTextAlignment.center
        uiText_styledText.text = """
        UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.
        This class supports multiple text styles through use of the attributedText property. (Styled text is not supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
        """
        itemY += itemY_increment
        scrollView.addSubview(uiLabel_styledText)
        scrollView.addSubview(uiText_styledText)
        
        
        //UITextView with disabled behavior
        let uiLabel_disabledBehavior = UILabel(frame: CGRect(x: itemX, y: itemY, width: itemWidth, height: labelHeight))
        uiLabel_disabledBehavior.text = "Disabled Behavior"
        let uiText_disabledBehavior = UITextView()
        uiText_disabledBehavior.frame = CGRect(x: itemX, y: itemY+labelTextViewOffset, width: itemWidth, height: itemHeight)
        uiText_disabledBehavior.layer.borderColor = UIColor.lightGray.cgColor
        uiText_disabledBehavior.layer.borderWidth = 1.0
        uiText_disabledBehavior.layer.cornerRadius = 8
        uiText_disabledBehavior.isEditable = false
        uiText_disabledBehavior.isSelectable = false
        uiText_disabledBehavior.isScrollEnabled = false
        uiText_disabledBehavior.text = """
        UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.
        This class supports multiple text styles through use of the attributedText property. (Styled text is not supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
        """
        itemY += itemY_increment
        scrollView.addSubview(uiLabel_disabledBehavior)
        scrollView.addSubview(uiText_disabledBehavior)
        
        
        //UITextView with attributed text
        let uiLabel_attributedText = UILabel(frame: CGRect(x: itemX, y: itemY, width: itemWidth, height: labelHeight))
        uiLabel_attributedText.text = "Attributed Text"
        
        let text = """
        UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.
        This class supports multiple text styles through use of the attributedText property. (Styled text is not supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
        """
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Bradley Hand Bold", size: 15)!,
            .foregroundColor: UIColor.orange
        ]
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        
        let uiText_attributedText = UITextView()
        uiText_attributedText.frame = CGRect(x: itemX, y: itemY+labelTextViewOffset, width: itemWidth, height: itemHeight)
        uiText_attributedText.layer.borderColor = UIColor.lightGray.cgColor
        uiText_attributedText.layer.borderWidth = 1.0
        uiText_attributedText.layer.cornerRadius = 8
        uiText_attributedText.attributedText = attributedText
        itemY += itemY_increment
        scrollView.addSubview(uiLabel_attributedText)
        scrollView.addSubview(uiText_attributedText)
    }
    
}
