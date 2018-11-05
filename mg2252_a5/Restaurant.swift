//
//  Restaurant.swift
//  mg2252_a5
//
//  Created by Medhavi Gandhi on 11/3/18.
//  Copyright © 2018 Medhavi Gandhi. All rights reserved.
//

import UIKit

enum Category: String, CaseIterable {
    case mexican = "Mexican"
    case american = "American"
    case koreaan = "Korean"
    case vietnamese = "Vietnamese"
    case ctown = "CTown"
    case commons = "Commons"
    case fastfood = "Fast Food"
    case japanese = "Japanese"
    case mediterranean = "Mediterranean"
    case indian = "Indian"
    
}

class Restaurant {
    var name: String!
    var rating: Int!
    var type: String!
    var profileimgName: String!
    
    init(imageName:String, restType:String, restRating: Int, restName:String) {
        self.name = restName
        self.rating = restRating
        self.type = restType
        self.profileimgName = imageName
    }

}
