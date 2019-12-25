//
//  CollegeFormViewController.swift
//  CoreDataRelation
//
//  Created by Pradeep on 25/12/19.
//  Copyright © 2019 Pradeep. All rights reserved.
//

import UIKit

class CollegeFormViewController: UIViewController {

    // MARK:  outlet
    @IBOutlet weak var txtCollegeName: UITextField!
    
    @IBOutlet weak var txtCollegeAddress: UITextField!
    
    @IBOutlet weak var txtCollegeCity: UITextField!
    
    @IBOutlet weak var txtCollegeUniversity: UITextField!
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
}
extension CollegeFormViewController{
    
    @IBAction func buttonCollegeSaveClick(_ sender: Any) {
        
        collegeSaveData()
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension CollegeFormViewController{
    
    func collegeSaveData() {
        
        guard let collegeName = txtCollegeName.text else {return}
        guard let collegeAddress = txtCollegeAddress.text else {return}
        guard let collegeCity = txtCollegeCity.text else {return}
        guard let collegeUniversity = txtCollegeUniversity.text else {return}
        
        var collegeDict = [
            
            "collegeName": collegeName,
            "collegeAddress":collegeAddress,
            "collegeCity":collegeCity,
            "collegeUniversity":collegeUniversity
        ]
        
        DatabaseHelper.sharedInstance.saveCollegeData(collegeDict: collegeDict)
    }
}
