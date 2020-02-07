//
//  TableViewCell.swift
//  MoviesList
//
//  Created by Mehedi on 2/7/20.
//  Copyright © 2020 MatrixSolution. All rights reserved.
//





import UIKit

class TableViewCell: UITableViewCell {
    
    static let id = "TableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var serialLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
