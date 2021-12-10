//
//  WKWebViewCustomController.swift
//  DisplayRichArticles
//
//  Created by Aparna Joshi on 27/11/21.
//

import UIKit
import WebKit

class WKWebViewCustomController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            print(message.body)
        }
        
        private lazy var  cross = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(crossClicked))
    
        private let decisionVariable:Int
    
        init(decisionVariable: Int ){
            self.decisionVariable = decisionVariable
            super.init(nibName: nil, bundle: nil)
        }
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
        var webView: WKWebView!
        let js = """
            document.addEventListener('click', function(){
                window.webkit.messageHandlers.clickListener.postMessage('My hovercraft is full of eels!');
            });
            setTimeout(() => {
                document.body.style.backgroundColor='#121212';
                document.getElementById('colorId').style.color='white'
            }, 5000);
        """
        let html = """
        <html>
            <head>
                <style>
                    body { font-family: -apple-system, Helvetica; sans-serif; }
                </style>
                <meta name='viewport' content='width=device-width, initial-scale=1'>
            </head>
            <body>
                <strong id='colorId'>Hello I am from a string</strong>
            </body>
        </html>
        """
    
        @objc private func crossClicked(){
            print("clicked clicked")
            dismiss(animated: true, completion: nil)
            
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let config = WKWebViewConfiguration()
            let script = WKUserScript(source: js, injectionTime: .atDocumentEnd, forMainFrameOnly: false)

            config.userContentController.addUserScript(script)
            config.userContentController.add(self, name: "clickListener")

            webView = WKWebView(frame: view.bounds, configuration: config)
            view.addSubview(webView!)
            navigationItem.leftBarButtonItem = cross
            
            if self.decisionVariable == 0{
                webView.loadHTMLString(html, baseURL: nil)
            }
            else {
                print(Bundle.main.url(forResource: "hello-world", withExtension: "html")!)
                if let url = Bundle.main.url(forResource: "hello-world", withExtension: "html") {
                    print("hello hello world")
                    webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
                }
            }
        }
    

}
