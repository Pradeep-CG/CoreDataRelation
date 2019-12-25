//
//  CollegeListViewController.swift
//  CoreDataRelation
//
//  Created by Pradeep on 25/12/19.
//  Copyright © 2019 Pradeep. All rights reserved.
//

import UIKit

class CollegeListViewController: UIViewController {

    @IBOutlet weak var collegeListTblView: UITableView!
    
    var arrCollege = [College]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        arrCollege = DatabaseHelper.sharedInstance.getAllCollegeData()
        print("arr = \(arrCollege)")
        for data in arrCollege{
            print(data.name!)
            print(data.city!)
            print(data.university!)
        }
        collegeListTblView.reloadData()
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        
        let collegeForm = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(collegeForm, animated: true)
    }
}
extension CollegeListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collegeTableViewCell") as! collegeTableViewCell
        cell.collegeData = arrCollege[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            arrCollege =  DatabaseHelper.sharedInstance.deleteCollegeData(index: indexPath.row)
            collegeListTblView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var detailVC = self.storyboard?.instantiateViewController(identifier: "CollegeDetailViewController") as! CollegeDetailViewController
        detailVC.index = indexPath.row
        detailVC.detail = arrCollege[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
