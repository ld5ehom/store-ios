//
//  PaymentViewController.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/8/24.
//

import UIKit
import WebKit

final class PaymentViewController: UIViewController {
    private var webView: WKWebView?
    
    // getData from payment server message (WKScriptMessageHandler)
    private let getMessageScriptName: String = "receiveMessage"
    private let getPaymentCompleteScriptName: String = "paymentComplete"
    
    /**
     Sets up the WKWebView with a configuration that includes a user content controller.
     */
    override func loadView() {
        // getData from payment server
        let contentController = WKUserContentController()
        contentController.add(self, name: getMessageScriptName)
        contentController.add(self, name: getPaymentCompleteScriptName)
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: .zero, configuration: config)
        view = webView
    }
    
    /**
     Loads the HTML file into the WKWebView and sets a custom user agent.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // WebView test URL - UCLA Store
//        webView?.load(URLRequest(url: URL(string: "https://www.uclastore.com/")!))
        
        loadWebView()
        setUserAgent()
        
        // test button - javascript payment function
        let button: UIButton = UIButton(frame: CGRect(x: 0, y: 400, width: 100, height: 100))
        button.setTitle("Payment!", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.callJavaScript()
        }), for: .touchUpInside)
        view.addSubview(button)
    }
    
    /**
     Loads a local HTML file into the WKWebView and sets a custom HTTP header.
     */
    private func loadWebView() {
        
        // html url (resource file name "test" , type: "html")
        guard let htmlPath = Bundle.main.path(forResource: "test", ofType: "html") else { return }
        
        // html path
        let url = URL(fileURLWithPath: htmlPath)
        
        // request
        var request = URLRequest(url: url)
        
        // HTTP HEADER for the payment server
        request.addValue("customValue", forHTTPHeaderField: "HeaderName")
        webView?.load(request)
    }
    
    /**
     Sets a custom user agent string for the WKWebView.
     */
    private func setUserAgent() {
        // app name
        webView?.customUserAgent = "Store-ios/1.0.0/iOS"
    }
    
    /**
     Sets a cookie for the WKWebView’s HTTP cookie store.
     */
    private func setCookie() {
        guard let cookie = HTTPCookie(properties: [
            .domain: "uclastore.com",
            .path: "/payment",
            .name: "ld5ehom",
            .value: "value",
            .secure: "TRUE",
            .expires: NSDate(timeIntervalSinceNow: 3600)
        ]) else { return }
        webView?.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
    }
    
    /**
     Executes a JavaScript payment function within the WKWebView.
     */
    private func callJavaScript() {
        webView?.evaluateJavaScript("javascriptFunction();")
    }
}

/**
 Handles messages received from JavaScript. Calls different actions based on the message name.
 */
extension PaymentViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == getMessageScriptName {
//            viewModel.process(action: .getMessage)
        } else if message.name == getPaymentCompleteScriptName {
//            viewModel.process(action: .completePayment)
        }
    }
}

// ctrl(command) + alt + enter  = preview on/off
#Preview {
    PaymentViewController()
}
