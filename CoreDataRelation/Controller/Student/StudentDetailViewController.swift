//
//  StudentDetailViewController.swift
//  CoreDataRelation
//
//  Created by Pradeep on 16/01/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {

    
    @IBOutlet weak var nameTxtfld: UITextField!
    @IBOutlet weak var emailtxtfld: UITextField!
    @IBOutlet weak var phoneTxtfld: UITextField!
    
    var college:College?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtnclick(_ sender: Any) {
        
        guard let name = nameTxtfld.text else { return }
        guard let email = emailtxtfld.text else { return }
        guard let phone = phoneTxtfld.text else { return }
        guard let collegeDetail = college else {
            return
        }
        var studentDict = [
            "studentName": name,
            "studentEmail": email,
            "studentPhone": phone
        ]
        DatabaseHelper.sharedInstance.saveStudentData(studentDict: studentDict,college: collegeDetail)
        
    }
    
}
