//
//  StudentListViewController.swift
//  CoreDataRelation
//
//  Created by Pradeep on 16/01/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var studentArr = [Student]()
    var college:College?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "studentCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        //studentArr = DatabaseHelper.sharedInstance.getAllStudentData()
        
        if college?.students?.allObjects != nil {
            studentArr = college?.students?.allObjects as! [Student]
        }
        tblView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func plusBtnClick(_ sender: UIBarButtonItem) {
        
        let studentdetailVc = self.storyboard?.instantiateViewController(identifier: "StudentDetailViewController") as! StudentDetailViewController
        studentdetailVc.college = college
        self.navigationController?.pushViewController(studentdetailVc, animated: true)
    }
}
extension StudentListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        if cell != nil {
            cell = UITableViewCell(style: .value2, reuseIdentifier: "studentCell")
        }
        cell.textLabel?.text = studentArr[indexPath.row].name
        cell.detailTextLabel?.text = studentArr[indexPath.row].email
        
        return cell
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArr.count
    }
}
