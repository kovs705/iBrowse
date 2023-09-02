//
//  WebViewModel.swift
//  iBrowse
//
//  Created by Eugene Kovs on 02.09.2023.
//


import SwiftUI
import Combine
import WebKit
import UIKit

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        // TODO
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        // TODO
        decisionHandler(.cancel)
    }
}

@MainActor
class WebViewModel: ObservableObject {
    let webView: WKWebView
    @Published var urlString: String = ""

    @Published var canGoBack: Bool = false
    @Published var canGoForward: Bool = false
    
    private let navigationDelegate: WebViewNavigationDelegate = WebViewNavigationDelegate()
    
    init() {
        webView = WKWebView(frame: .zero)
        loadUrl()
    }
    
    func loadUrl() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    func goForward() {
        webView.goForward()
    }
    
    func goBack() {
        webView.goBack()
    }
    
    private func setupBindings() {
        webView.publisher(for: \.canGoBack)
            .assign(to: &$canGoBack)
        
        webView.publisher(for: \.canGoForward)
            .assign(to: &$canGoForward)
    }
}

