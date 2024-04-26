//
//  Profile.swift
//  TechAssessment
//
//  Created by Darshana  on 26/04/24.
//

import Foundation

class Profile {
    var userId : Int?
    var id : Int?
    var title : String?
    var body : String?
    
    init(profile: NSDictionary) {
        self.userId = profile.object(forKey: "userId") as? Int
        self.id = profile.object(forKey: "id") as? Int
        self.title = profile.object(forKey: "title") as? String
        self.body = profile.object(forKey: "body") as? String
    }
}
