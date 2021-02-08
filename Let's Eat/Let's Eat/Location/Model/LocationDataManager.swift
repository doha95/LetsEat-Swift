//
//  LocationDataManager.swift
//  Let's Eat
//
//  Created by Doha Tubaileh on 3/2/2021.
//

import Foundation

class LocationDataManager : DataManager {
    
    private var locations:[String] = [];
    
//    private func loadData() -> [[String:AnyObject]]{
//        guard let path = Bundle.main.path(forResource: "Locations", ofType: "plist"),let items = NSArray(contentsOfFile:
//                                                                                                            path) else {
//            return [[:]];
//        }
//        return items as! [[String:AnyObject]];
//    }
    
    
    func fetch(){
        for location in loadData(fileName: "Locations") {
            if let city = location["city"] as? String, let state = location["state"] as? String {
                self.locations.append("\(city), \(state)")
            }
        }
    }
    
    func numberOfItems() -> Int {
        return locations.count
    }
    
    func locationItem(at index:IndexPath) -> String {
        return locations[index.item]
    }

    
}
