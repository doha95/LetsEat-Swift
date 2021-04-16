//
//  RestaurantAPIManager.swift
//  Let's Eat
//
//  Created by Doha Tubaileh on 11/2/2021.
//

import Foundation

struct RestaurantAPIManager {
//    static func loadJSON(file name:String) ->
//    [[String:AnyObject]]{
//        var items = [[String:AnyObject]]();
//        guard let path = Bundle.main.path(forResource: name,
//                                          ofType: "json"),let data = NSData(contentsOfFile: path)
//        else {
//            return [[:]]
//        }
//        do {
//            let json = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as AnyObject;
//            if let restaurants = json as? [[String:AnyObject]] {
//                items = restaurants as [[String:AnyObject]]
//            }
//        } catch {
//            print("error serializing JSON: \(error)")
//            items = [[:]]
//        }
//        return items
//    }
    
    static func loadJSON(file name:String) -> [[String:AnyObject]]{
        
        var items = [[String:AnyObject]]();
        
        guard let path = Bundle.main.path(forResource: name, ofType: "json"), let item = NSData(contentsOfFile: path) else {
            return [[:]];
        }
        do {
            let json = try JSONSerialization.jsonObject(with: item as Data, options: .allowFragments);
            if let resturant = json as? [[String:AnyObject]] {
                items = resturant as [[String:AnyObject]];
            }
            
            
        } catch  {
            print("error serializing JSON: \(error)");
            
        }
        return items;
    }
    
}
