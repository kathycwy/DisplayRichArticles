//
//  commentSectionViewController.swift
//  DisplayRichArticles
//
//  Created by Samuel Kwong on 09.12.21.
//

import UIKit

class commentSectionViewController: UIViewController {
    
    @IBOutlet weak var txtComment: UITextView!
    @IBOutlet weak var tblCommentView: UITableView!
    var arrComments = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtComment.becomeFirstResponder()
    }
    
    @IBAction func btnSendTapped(_ sender: UIButton) {
        let commentTxt = txtComment.text!
        arrComments.append(commentTxt)
        tblCommentView.reloadData()
        txtComment.resignFirstResponder()
    }
    
}

extension commentSectionViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrComments[indexPath.row]
        return cell
    }
}
