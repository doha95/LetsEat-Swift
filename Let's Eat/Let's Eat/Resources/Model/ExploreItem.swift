//
//  ExploreItem.swift
//  Let's Eat
//
//  Created by Doha Tubaileh on 30/1/2021.
//

import Foundation

struct ExploreItem {
    var name : String;
    var image : String;
}

extension ExploreItem {
    init(dict:[String:AnyObject]) {
        self.name = dict["name"] as! String;
        self.image = dict["image"] as! String;
        
    }
}
