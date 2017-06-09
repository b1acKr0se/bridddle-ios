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
    var title: String?
    var description: String?
    var viewCounts: Int = 0
    var likeCounts: Int = 0
    var commentCounts: Int = 0
    var url: String?
    var user: User?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        description <- map["description"]
        viewCounts <- map["views_count"]
        likeCounts <- map["likes_count"]
        commentCounts <- map["comments_count"]
        url <- map["images.normal"]
        user <- map["user"]
    }
    
    init(title: String?,
         description: String?,
         viewsCount: Int = 0,
         likeCounts: Int = 0,
         commentCounts: Int = 0,
         url: String?,
         user: User? ) {
        self.title = title
        self.description = description
        self.viewCounts = viewsCount
        self.likeCounts = likeCounts
        self.commentCounts = commentCounts
        self.user = user
        self.url = url
        
    }
}

