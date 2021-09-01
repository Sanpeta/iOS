//
//  ViewController.swift
//  WebKit
//
//  Created by Sidnei de Souza Junior on 10/09/17.
//  Copyright © 2017 Sidnei de Souza Junior. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, web {

    var webView: UIWebView!
    
    override func loadView() {
        webView = UIWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.com.br")
        let urlRequest = URLRequest(url: url!)
        webView.loadRequest(urlRequest)
        
    }
    
    


}

