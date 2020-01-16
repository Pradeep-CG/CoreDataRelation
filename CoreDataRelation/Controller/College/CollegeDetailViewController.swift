//
//  CollegeDetailViewController.swift
//  CoreDataRelation
//
//  Created by Pradeep on 26/12/19.
//  Copyright © 2019 Pradeep. All rights reserved.
//

import UIKit

class CollegeDetailViewController: UITableViewController {

    @IBOutlet weak var collegeNameLbl: UILabel!
    @IBOutlet weak var collegeUniversityLbl: UILabel!
    @IBOutlet weak var collegeAddressLbl: UILabel!
    @IBOutlet weak var collegeCityLbl: UILabel!
    @IBOutlet weak var studentLbl: UILabel!
    
    var detail:College?
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        print(detail)
        collegeNameLbl.text = detail?.name
        collegeCityLbl.text = detail?.city
        collegeAddressLbl.text = detail?.address
        collegeUniversityLbl.text = detail?.university
        
        if let student = detail?.students?.allObjects as? [Student] {
            
            studentLbl.text = "\(student.count)"
        }
        else{
            studentLbl.text = "0"
        }
    }
    @IBAction func onEditClick(_ sender: Any) {
        
        let collegeForm = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        collegeForm.selectedIndex = index
        collegeForm.formDetail = detail
        collegeForm.isUpdate = true
        self.navigationController?.pushViewController(collegeForm, animated: true)
    }
}

extension CollegeDetailViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            
            let studentlistVc = self.storyboard?.instantiateViewController(identifier: "StudentListViewController") as! StudentListViewController
            studentlistVc.college = detail
            self.navigationController?.pushViewController(studentlistVc, animated: true)
            
        }
    }
}
