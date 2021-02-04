//
//  LocationViewController.swift
//  Let's Eat
//
//  Created by Doha Tubaileh on 3/2/2021.
//

import UIKit

class LocationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    let manager = LocationDataManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.fetch();
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.numberOfItems();
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as UITableViewCell;
        cell.textLabel?.text = self.manager.locationItem(at: indexPath);
        
        return cell;
    }
    

}
