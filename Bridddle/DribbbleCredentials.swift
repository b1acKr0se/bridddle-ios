//
//  DribbbleLogin.swift
//  Bridddle
//
//  Created by nguyen.thanh.hai on 6/9/17.
//  Copyright © 2017 Hai Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class DribbbleCredentials {
    var clientId: String?
    var clientSecret: String?
    var defaultAccessToken: String?
    var userDefauls: UserDefaults
    
    init(_ userDef: UserDefaults) {
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let dict = keys {
            clientId = dict["clientId"] as? String
            clientSecret = dict["clientSecret"] as? String
            defaultAccessToken = dict["clientAccessToken"] as? String
        }
        userDefauls = userDef
    }
    
    //MARK: Public Methods
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
    
    public func logout() {
        userDefauls.removeObject(forKey: "access_token")
    }
    
    func processOAuthResponse(_ url: URL) {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        var code: String?
        if let queryItems = components?.queryItems {
            for queryItem in queryItems {
                if queryItem.name.lowercased() == "code" {
                    code = queryItem.value
                    break
                }
            }
        }
        
        guard let cs = clientSecret else {
            fatalError("Client Secret not presented in Keys.plist")
        }
        
        if let receivedCode = code {
            let getTokenPath = "https://dribbble.com/oauth/token"
            let tokenParams: [String: Any] = ["client_id": clientId!, "client_secret": cs, "code": receivedCode]
            Alamofire.request(getTokenPath, method: .post, parameters: tokenParams, encoding: JSONEncoding.default, headers: nil).responseJSON {
                response  in switch response.result {
                case .success(let json):
                    let res = json as! NSDictionary
                    guard let accessToken = res.object(forKey: "access_token") else {
                        return
                    }
                    self.userDefauls.set(accessToken, forKey: "access_token")
                default:
                    print("default")
                }
                
            }
        }
    }
    
    func getAccessToken() -> String? {
        if userDefauls.string(forKey: "access_token") != nil  {
            return userDefauls.string(forKey: "access_token")
        }
        guard defaultAccessToken != nil else {
            return nil
        }
        return defaultAccessToken
    }
    
    func isLoggedIn() -> Bool {
        return userDefauls.string(forKey: "access_token") != nil
    }
}
