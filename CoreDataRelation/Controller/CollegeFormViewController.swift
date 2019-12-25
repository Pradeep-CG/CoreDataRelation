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
    @IBOutlet weak var saveBtn: UIButton!
    
    var formDetail:College?
    var isUpdate = false
    var selectedIndex = Int()
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        txtCollegeName.text = formDetail?.name
        txtCollegeAddress.text = formDetail?.address
        txtCollegeCity.text = formDetail?.city
        txtCollegeUniversity.text = formDetail?.university
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if isUpdate {
            saveBtn.setTitle("Update", for: .normal)
        }
        else{
            saveBtn.setTitle("Save", for: .normal)
        }
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
        if isUpdate {
            isUpdate = false
            DatabaseHelper.sharedInstance.updateCollegeData(dict: collegeDict, index: selectedIndex)
        }
        else{
            DatabaseHelper.sharedInstance.saveCollegeData(collegeDict: collegeDict)
        }
        
    }
}
