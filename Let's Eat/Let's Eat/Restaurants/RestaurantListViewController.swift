//
//  RestaurantListViewController.swift
//  Let's Eat
//
//  Created by Doha Tubaileh on 6/1/2021.
//

import UIKit

class RestaurantListViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return
            collectionView.dequeueReusableCell(withReuseIdentifier:
                                                "restaurantCell", for: indexPath);
    }
    
    
    
    
}
