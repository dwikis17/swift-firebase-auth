//
//  WebViewerController.swift
//  swift-login-firebase
//
//  Created by Dwiki Dwiki on 26/10/23.
//

import UIKit
import WebKit

class WebViewerController: UIViewController {
    
    private let urlString: String
    
    private let webView: WKWebView = {
        let wv = WKWebView()
        return wv
    }()
    
    init(with urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        guard let url = URL(string: urlString) else { self.dismiss(animated: true, completion: nil); return }
        
        self.webView.load(URLRequest(url: url))
    }
    
    private func setupUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        self.view.addSubview(webView)
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
    
        ])
    }
    
    @objc private func didTapDone() {
        self.dismiss(animated: true)
    }


}
