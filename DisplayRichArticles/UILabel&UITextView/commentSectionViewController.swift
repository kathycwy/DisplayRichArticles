//
//  commentSectionViewController.swift
//  DisplayRichArticles
//
//  Created by Samuel Kwong on 09.12.21.
//

import UIKit

class commentSectionViewController: UIViewController {
    
    @IBOutlet weak var inputComment: UITextView!
    @IBOutlet weak var tblCommentView: UITableView!
    var arrComments = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblCommentView.estimatedRowHeight = 60
        tblCommentView.rowHeight = UITableView.automaticDimension
        self.inputComment.layer.borderWidth = 1.0
        self.inputComment.layer.borderColor = UIColor.gray.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inputComment.becomeFirstResponder()
    }
    
    @IBAction func btnSendTapped(_ sender: UIButton) {
        let commentTxt = inputComment.text!
        arrComments.append(commentTxt)
        tblCommentView.reloadData()
        inputComment.resignFirstResponder()
    }
    
}

extension commentSectionViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TextTableViewCell
        let font = UIFont.systemFont(ofSize: 24)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.firstLineHeadIndent = 5.0

        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.blue,
            .paragraphStyle: paragraphStyle
        ]

        let attributedText = NSAttributedString(string: arrComments[indexPath.row], attributes: attributes)
        cell.textComment.attributedText = attributedText
        return cell
    }
}
