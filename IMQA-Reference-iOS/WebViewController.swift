//
//  ViewController.swift
//  IMQA-Reference-iOS
//
//  Created by 차용빈 on 2022/04/10.
//

import UIKit
import WebKit
import IMQAMPMAgent

class WebViewController: UIViewController {
    
    let webView = WKWebView()

    
    var userContentController = WKUserContentController.init()

    
    override func loadView() {
        self.view = webView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let configuration = WKWebViewConfiguration.init()
        configuration.userContentController = self.userContentController
        webView.configuration.userContentController.add(self, name: "ImqaBridge")
        
        
        if let url = URL(string: "https://imqa.io") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        
    }
}

extension WebViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
      // IMQA 설정 부분
      if(message.name == "ImqaBridge") {
          IMQAMpm.sharedInstance.saveWebviewPostMessage(self, "\(message.body)")
      }
    }
    
}
