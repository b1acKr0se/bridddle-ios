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
    var dribbbleLogin: DribbbleCredentials = DribbbleCredentials(UserDefaults.standard)
    
    //MARK: Public functions
    public func getPopular(page: Int, perPage: Int = 30) -> DataRequest? {
        if let at = dribbbleLogin.getAccessToken() {
            let constructedUrl = "https://api.dribbble.com/v1/shots?access_token=\(at)&page=\(page)"
            return Alamofire.request(constructedUrl)
        }
        return nil
    }
}
