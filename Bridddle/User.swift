//
//  swift
//  Bridddle
//
//  Created by nguyen.thanh.hai on 6/8/17.
//  Copyright © 2017 Hai Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    var id: Int?
    var name: String?
    var username: String?
    var avatarUrl: String?
    var location: String?
    var bio: String?
    var shotCounts: Int?
    var likeReceived: Int?
    var followers: Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        avatarUrl <- map["avatar_url"]
        location <- map["location"]
        bio <- map["bio"]
        shotCounts <- map["shots_count"]
        likeReceived <- map["likes_received_count"]
        followers <- map["followers_count"]
    }
    
    init(id: Int = 0,
         name: String?,
         username: String?,
         avatarUrl: String?,
         location: String?,
         bio: String?,
         shotCounts: Int = 0,
         likeReceived: Int = 0,
         followers: Int = 0) {
        self.id = id
        self.name = name
        self.username = username
        self.avatarUrl = avatarUrl
        self.location = location
        self.bio = bio
        self.shotCounts = shotCounts
        self.likeReceived = likeReceived
        self.followers = followers
    }
    
}
