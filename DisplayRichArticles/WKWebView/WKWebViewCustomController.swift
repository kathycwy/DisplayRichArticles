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
        
        var webView: WKWebView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let config = WKWebViewConfiguration()
            let js = "document.addEventListener('click', function(){ window.webkit.messageHandlers.clickListener.postMessage('My hovercraft is full of eels!'); }); setTimeout(() => {document.body.style.backgroundColor='#121212'; document.getElementById('colorId').style.color='white'}, 5000);"
            let script = WKUserScript(source: js, injectionTime: .atDocumentEnd, forMainFrameOnly: false)

            config.userContentController.addUserScript(script)
            config.userContentController.add(self, name: "clickListener")

            webView = WKWebView(frame: view.bounds, configuration: config)
            view.addSubview(webView!)
            
            let html = "<strong id='colorId'>So long and thanks for all the fish!</strong>"
            
            webView.loadHTMLString("<html><head><style>body { font-family: -apple-system, Helvetica; sans-serif; }</style><meta name='viewport' content='width=device-width, initial-scale=1'></head><body>\(html)</body></html>", baseURL: nil)
        }
    
        @IBAction func unwindToMain(unwindSegue : UIStoryboardSegue){
            
        }

}
