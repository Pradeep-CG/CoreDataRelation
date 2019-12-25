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
    }
    @IBAction func onEditClick(_ sender: Any) {
        
        let collegeForm = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        collegeForm.selectedIndex = index
        collegeForm.formDetail = detail
        collegeForm.isUpdate = true
        self.navigationController?.pushViewController(collegeForm, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
