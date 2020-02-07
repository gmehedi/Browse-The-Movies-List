//
//  ViewController.swift
//  MoviesList
//
//  Created by Mehedi on 2/6/20.
//  Copyright © 2020 MatrixSolution. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet  weak var tableView: UITableView!
    
    var serialArray = [String]()
    var nameArray = [String]()
    var descriptionArray = [String]()
    var len: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "MoviesList", ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)
            
        serialArray = dict!.object(forKey: "serial") as! [String]
        nameArray = dict!.object(forKey: "name") as! [String]
        descriptionArray = dict!.object(forKey: "description") as! [String]
        len = serialArray.count
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        let nib = UINib(nibName: TableViewCell.id, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: TableViewCell.id)
    
        //Do any additional setup after loading the view.
    }

}
extension TableViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return len
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String("The Least Of The Movies")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88.00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as? TableViewCell
        
        cell?.descriptionLabel.text = self.descriptionArray[indexPath.row]
        cell?.nameLabel.text = self.nameArray[indexPath.row]
        cell?.serialLabel.text = self.serialArray[indexPath.row]
        
        return cell!
        
    }
    
    
}


