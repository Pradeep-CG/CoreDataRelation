//
//  collegeTableViewCell.swift
//  CoreDataRelation
//
//  Created by Pradeep on 25/12/19.
//  Copyright © 2019 Pradeep. All rights reserved.
//

import UIKit

class collegeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCollegeUniversity: UILabel!
    @IBOutlet weak var lblCollegeCity: UILabel!
    @IBOutlet weak var lblCollegeName: UILabel!
    
    var collegeData:College!{
        didSet{
            lblCollegeName.text = collegeData.name
            lblCollegeCity.text = collegeData.city
            lblCollegeUniversity.text = collegeData.university
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
