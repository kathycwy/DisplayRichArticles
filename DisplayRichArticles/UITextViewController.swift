//
//  UITextView.swift
//  DisplayRichArticles
//
//  Created by Wingyin Chan on 20.11.21.
//

import UIKit

class UITextViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setUITextView()
    }
    
    func setUITextView() {
        
        let uiText = UITextView()
        uiText.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
        uiText.layer.borderColor = UIColor.lightGray.cgColor
        uiText.layer.borderWidth = 1.0
        uiText.layer.cornerRadius = 8
        uiText.font = UIFont.systemFont(ofSize: 14)
        uiText.text = """
        UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.
        This class supports multiple text styles through use of the attributedText property. (Styled text is not supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
        """
        uiText.isScrollEnabled = true
        
        view.addSubview(uiText)
    }
    
}
