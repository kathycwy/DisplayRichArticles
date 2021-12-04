//
//  WKWebViewWebsiteController.swift
//  DisplayRichArticles
//
//  Created by Aparna Joshi on 27/11/21.
//

import UIKit
import WebKit

class WKWebViewWebsiteController: UIViewController {

    private let webView : WKWebView = {
       
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        return webView
    }()
    
    private let url:URL
    @objc private func didTapDone(){
        print("done pressed")
        dismiss(animated: true, completion: nil)
        
    }
    @objc private func didTapRefresh(){
        print("done pressed")
        webView.load(URLRequest(url: url))
    }
    @objc private func goBack(){
        webView.goBack()
    }
    @objc private func goForward(){
        webView.goForward()
    }
    
    let cross = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(didTapDone))
    let back = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(goBack))
    let front = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(goForward))
    
    init(url:URL,title:String){
        self.url = url
        super.init(nibName: nil, bundle: nil)
        self.title = title
        _ = self.view

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "loading") {
            back.isEnabled = webView.canGoBack
            front.isEnabled = webView.canGoForward
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        configureButtons()
        back.isEnabled = false
        front.isEnabled = false
      
        webView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
        webView.load(URLRequest(url: url))
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

    private func configureButtons(){
        
        navigationItem.leftBarButtonItems = [cross,back,front]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapRefresh))
        
       
        
    }
    
    
}


//class WKWebViewWebsiteController: UIViewController, WKNavigationDelegate {
//
//        var webView: WKWebView!
//
//        override func loadView() {
//           webView = WKWebView()
//           webView.navigationDelegate = self
//           view = webView
//        }
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//            let url = URL(string: "https://hci.rwth-aachen.de/")!
//            webView?.load(URLRequest(url: url))
//            webView.allowsBackForwardNavigationGestures = true
//        }
//
//        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
//        {
//            print(#function)
//        }
//
//        func webView(_ webView: WKWebView, didCommit commit: WKNavigation!)
//        {
//            print(#function)
//        }
//
//        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
//        {
//            print(#function)
//        }
//
//        func webView(_ webView: WKWebView, didFail fail: WKNavigation!, withError error: Error)
//        {
//            print(#function)
//            print(error)
//        }
//
//        func webView(_ webView: WKWebView, didFailProvisionalNavigation provNavigation: WKNavigation!, withError error: Error)
//        {
//            print(#function)
//            print(error)
//        }
//
//        @IBAction func unwindToMain(unwindSegue : UIStoryboardSegue){
//
//        }
//
//}
