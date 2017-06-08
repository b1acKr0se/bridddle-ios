//
//  Shot.swift
//  Bridddle
//
//  Created by nguyen.thanh.hai on 6/8/17.
//  Copyright © 2017 Hai Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper

class Shot: Mappable {
    var url: String?
    
    required init?(map: Map) {
    }

    func mapping(map: Map) {
        url <- map["images.normal"]
    }
    
    init(url: String?) {
        self.url = url
    }
}

