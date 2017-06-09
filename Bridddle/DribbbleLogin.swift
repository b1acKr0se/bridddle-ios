//
//  DribbbleLogin.swift
//  Bridddle
//
//  Created by nguyen.thanh.hai on 6/9/17.
//  Copyright © 2017 Hai Nguyen. All rights reserved.
//

import UIKit
import Foundation

class DribbbleLogin {
    var clientId: String?
    
    
    init() {
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let dict = keys {
            clientId = dict["clientId"] as? String
        }
    }
    
    func login() {
        guard let id = clientId else {
            fatalError("ClientId not presented in Keys.plist")
        }
        
        let authUrl = "https://dribbble.com/oauth/authorize?client_id=\(id)&redirect_uri=plaid%3A%2F%2Fauth-callback&scope=public+write+comment+upload"
        
        if let url: URL = URL(string: authUrl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
}
