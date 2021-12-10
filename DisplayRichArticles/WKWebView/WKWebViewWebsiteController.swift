//
//  WKWebViewWebsiteController.swift
//  DisplayRichArticles
//
//  Created by Aparna Joshi on 27/11/21.
//

import UIKit
import WebKit

class WKWebViewWebsiteController: UIViewController, WKNavigationDelegate {

    private let webView : WKWebView = {
       
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        return webView
    }()
    
    private let url:URL
    
    var progressView : UIProgressView!
    
    @objc private func crossClicked(){
        print("clicked clicked")
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
    
    private lazy var  cross = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(crossClicked))
    private lazy var  back = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(goBack))
    private lazy var  front = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(goForward))
    
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
        
        if (keyPath == "estimatedProgress") {
            
            progressView?.isHidden = webView.estimatedProgress == 1
            progressView?.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        view.addSubview(progressView)

        configureButtons()
        back.isEnabled = false
        front.isEnabled = false
      
        webView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.load(URLRequest(url: url))
        webView.navigationDelegate = self
        
        if #available(iOS 11, *) {
            let dataStore = WKWebsiteDataStore.default()
            dataStore.httpCookieStore.getAllCookies({ (cookies) in
                print(cookies)
            })
        } else {
            guard let cookies = HTTPCookieStorage.shared.cookies else {
                return
            }
            print(cookies)
        }
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

    private func configureButtons(){
        navigationItem.leftBarButtonItems = [cross,back,front]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapRefresh))
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            print(host)
            if (host == "hci.rwth-aachen.de") || (host == "www.youtube.com") {
                decisionHandler(.allow)
                return
            }
            else {
                let alertController = UIAlertController(title: "iOScreator", message:
                        "Oops! You can't load that URL", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
        }
        decisionHandler(.cancel)
    }
        
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView?.setProgress(0.0, animated: false)
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
