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
        cell.textComment.text = arrComments[indexPath.row]
        return cell
    }
}
