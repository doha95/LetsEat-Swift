import UIKit
import PlaygroundSupport;

class TableViewExampleController:UIViewController,UITableViewDelegate,UITableViewDataSource, UITabBarControllerDelegate {
    
    var tableView : UITableView? ;
    
    func setUp(){
        tableView = UITableView(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height));
        tableView?.backgroundColor = .white;
        tabBarController?.delegate = self;
        tableView?.dataSource = self;
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell");
        self.view.addSubview(tableView!);
    }
    
    override func viewDidLoad() {
        setUp();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "tableCell",for: indexPath);
        
        cell.backgroundColor  = .red;
        return cell;
    }
    
    
    
}

PlaygroundPage.current.liveView = TableViewExampleController();
