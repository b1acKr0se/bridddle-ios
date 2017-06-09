//
//  DataManager.swift
//  Bridddle
//
//  Created by nguyen.thanh.hai on 6/8/17.
//  Copyright © 2017 Hai Nguyen. All rights reserved.
//

import Foundation
import Alamofire

class DataManager {
    var accessToken: String?
    
    init() {
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let dict = keys {
            accessToken = dict["clientAccessToken"] as? String
        }
    }
    
    func getPopular(page: Int, perPage: Int = 30) -> DataRequest? {
        if let at = accessToken {
            let constructedUrl = "https://api.dribbble.com/v1/shots?access_token=\(at)&page=\(page)"
            return Alamofire.request(constructedUrl)
        }
        return nil
    }
}
