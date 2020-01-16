
//
//  DatabaseHelper.swift
//  CoreDataRelation
//
//  Created by Pradeep on 25/12/19.
//  Copyright © 2019 Pradeep. All rights reserved.
//

import UIKit
import CoreData

class DatabaseHelper: NSObject {

    static let sharedInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveCollegeData(collegeDict:[String: String]) {
        
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        
        college.name = collegeDict["collegeName"]
        college.address = collegeDict["collegeAddress"]
        college.city = collegeDict["collegeCity"]
        college.university = collegeDict["collegeUniversity"]

        do {
            try context.save()
        } catch  {
            print("error = \(error.localizedDescription)")
        }
    }
    func getAllCollegeData() -> [College] {
        
        var arrCollege = [College]()
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "College")
        do {
            arrCollege =  try context.fetch(fetchReq) as! [College]
        } catch {
            print("error = \(error.localizedDescription)")
        }
        return arrCollege
    }
    func deleteCollegeData(index:Int) -> [College]{
        
        var collegeData = self.getAllCollegeData()
        
        context.delete(collegeData[index])
        collegeData.remove(at: index)
        do {
            try context.save()
        } catch {
            print("error = \(error.localizedDescription)")
        }
        return collegeData
    }
    func updateCollegeData(dict:[String:String], index:Int) {
        
        var collegeDict = self.getAllCollegeData()
        
        collegeDict[index].name = dict["collegeName"]
        collegeDict[index].address = dict["collegeAddress"]
        collegeDict[index].city = dict["collegeCity"]
        collegeDict[index].university = dict["collegeUniversity"]
        
        do {
                   try context.save()
               } catch {
                   print("error = \(error.localizedDescription)")
               }
    }
    
    func saveStudentData(studentDict:[String: String], college: College) {
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        
        student.name = studentDict["studentName"]
        student.email = studentDict["studentEmail"]
        student.phone = studentDict["studentPhone"]
        student.university = college

        do {
            try context.save()
        } catch  {
            print("error = \(error.localizedDescription)")
        }
    }
    
    func getAllStudentData() -> [Student] {
        
        var arrStudent = [Student]()
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            arrStudent =  try context.fetch(fetchReq) as! [Student]
        } catch {
            print("error = \(error.localizedDescription)")
        }
        return arrStudent
    }
}
