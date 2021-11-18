//
//  NSAttrStringViewController.swift
//  DisplayRichArticles
//
//  Created by C Chan on 18/11/2021.
//

import UIKit

class NSAttrStringViewController: UIViewController {

    
    let appRedColor = UIColor(red: 230.0/255.0, green: 51.0/255.0, blue: 49.0/255.0, alpha: 1.0)
    let appBlueColor = UIColor(red: 62.0/255.0, green: 62.0/255.0, blue: 145.0/255.0, alpha: 1.0)
    let appYellowColor = UIColor(red: 248.0/255.0, green: 175.0/255.0, blue: 0.0, alpha: 1.0)
    let darkOrangeColor = UIColor(red: 248.0/255.0, green: 150.0/255.0, blue: 75.0/255.0, alpha: 1.0)
    
    @IBOutlet weak var nsAttrStrLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setFirstLable()
        self.setSecondLable()
        self.setThirdLabel()
        self.setFourthLabel()
        self.setFifthLable()
    
    }
    
    func getRange(attributedString: String, substr: String) -> NSRange {
        return (attributedString as NSString).range(of: substr)
    }
    
    func setFirstLable() {
        self.firstLabel.numberOfLines = 0
        let text = "This is a colorful attributed string"
        let font = UIFont.systemFont(ofSize: 24)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: getRange(attributedString: text, substr: "This"))
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: getRange(attributedString: text, substr: "is"))
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: getRange(attributedString: text, substr: "colorful"))
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: getRange(attributedString: text, substr: "attributed"))
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.yellow, range: getRange(attributedString: text, substr: "string"))
        self.firstLabel.attributedText = attributedText
    }

    func setSecondLable() {
        self.secondLabel.numberOfLines = 0
        let text = "This string is having multiple font"
        let font = UIFont.systemFont(ofSize: 24)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.firstLineHeadIndent = 5.0

        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.blue,
            .paragraphStyle: paragraphStyle
        ]
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 24), range: getRange(attributedString: text, substr: "This"))
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.italicSystemFont(ofSize: 24), range: getRange(attributedString: text, substr: "string"))
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "HelveticaNeue-BoldItalic", size: 20)!, range: getRange(attributedString: text, substr: "having"))
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)!, range: getRange(attributedString: text, substr: "multiple"))
        self.secondLabel.attributedText = attributedText
    }
    
    func setThirdLabel() {
        self.thirdLabel.numberOfLines = 0
        let text = "This is a strick-through string"
        let font = UIFont.systemFont(ofSize: 24)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .strokeWidth: -2,
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white
        ]
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: getRange(attributedString: text, substr: "stroke string"))
        attributedText.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.thick.rawValue, range: getRange(attributedString: text, substr: "strick-through"))
        self.thirdLabel.attributedText = attributedText
    }
    
    func setFourthLabel() {
        self.fourthLabel.numberOfLines = 0
        let text = "This string is having a shadow"
        let font = UIFont.systemFont(ofSize: 24)
        
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 4.0, height: 4.0)
        shadow.shadowColor = UIColor.black
        shadow.shadowBlurRadius = 4.0
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        attributedText.addAttribute(NSAttributedString.Key.shadow, value: shadow, range: getRange(attributedString: text, substr: "having a shadow"))
        self.fourthLabel.attributedText = attributedText
    }
    
    func setFifthLable() {
        self.fifthLabel.numberOfLines = 0
        let text = "This is a stroke string with background"
        let font = UIFont.systemFont(ofSize: 24)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .backgroundColor: UIColor.yellow,
            .strokeWidth: -2,
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white
        ]
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        attributedText.addAttribute(NSAttributedString.Key.strokeColor, value: UIColor.red, range: getRange(attributedString: text, substr: "stroke string"))
        attributedText.addAttribute(NSAttributedString.Key.strokeWidth, value: 2, range: getRange(attributedString: text, substr: "stroke string"))
        self.fifthLabel.attributedText = attributedText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
