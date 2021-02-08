//
//  DataManager.swift
//  Let's Eat
//
//  Created by Doha Tubaileh on 8/2/2021.
//

import Foundation

protocol DataManager {
    func loadData(fileName:String) -> [[String:AnyObject]];
}

extension DataManager {
    func loadData(fileName:String) -> [[String:AnyObject]] {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "plist"), let items = NSArray(contentsOfFile:path) else {
            return [[:]];
        }
        return items as! [[String:AnyObject]];
    }
}
