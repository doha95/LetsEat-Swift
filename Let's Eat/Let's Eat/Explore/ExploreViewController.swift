//
//  ExploreViewController.swift
//  Let's Eat
//
//  Created by Doha Tubaileh on 25/12/2020.
//

import UIKit

class ExploreViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath);
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath:IndexPath) -> UICollectionReusableView {
        let headerView =
            collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                            withReuseIdentifier: "header", for: indexPath)
        return headerView
    }
    
    
}
