//
//  MapDataManager.swift
//  Let's Eat
//
//  Created by Doha Tubaileh on 8/2/2021.
//

import Foundation


class MapDataManager : DataManager {
    
    fileprivate var items:[RestaurantItem] = [];
    
    var annotations:[RestaurantItem] {//this will only for the "get", not the "set", in this way we guard the items against manipulation
        return items;
    }
    

    func fetch (completions:(_ annotations:[RestaurantItem])->()){
        if annotations.count > 0 {
            //check if the annotations already had been filled, just make it empty
            items.removeAll();
        }
        for returant in loadData(fileName: "MapLocations") {
            items.append(RestaurantItem(dict: returant));
        }
        completions(annotations);
    }
}
