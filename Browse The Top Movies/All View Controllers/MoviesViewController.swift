//
//  ViewController.swift
//  MoviesList
//
//  Created by Mehedi on 2/6/20.
//  Copyright © 2020 MatrixSolution. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
//    var dataArray: [Dictionary<String, String>] = []
      var dataArray = [Dictionary<String, String>]()
      var tt = Dictionary<String, Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.url(forResource: "SelfTest", withExtension: "plist") {
                   if let englishFromPlist = NSDictionary(contentsOf: path){
                    tt = englishFromPlist as! Dictionary;
                    print(String("\(tt.keys)"))
                 }
               }
       

        if let path = Bundle.main.url(forResource: "MoviesData", withExtension: "plist") {
            if let englishFromPlist = NSArray(contentsOf: path){
                dataArray = englishFromPlist as! [Dictionary<String, String>]
          }
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        let nib = UINib(nibName: MoviesViewCell.id, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: MoviesViewCell.id)
    
        //Do any additional setup after loading the view.
    }

}
extension MoviesViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String("The Least Of The Movies")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: MoviesViewCell.id, for: indexPath) as? MoviesViewCell
        
        cell?.descriptionLabel.text = self.dataArray[indexPath.row]["Description"]
        cell?.nameLabel.text = self.dataArray[indexPath.row]["Title"]
        cell?.serialLabel.text = String("\(indexPath.row + 1)")
        
        
        return cell!
        
    }
    
}


