//
//  SaveViewController.swift
//  Calendar_test
//
//  Created by 백유진 on 20/06/2019.
//  Copyright © 2019 백유진. All rights reserved.
//

import CoreData
import UIKit

class SaveViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textDate: UITextField!
    @IBOutlet var textName: UITextField!
    @IBOutlet var textMeomo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        return true
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Calendars", in: context)
        // Calendar record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(textName.text, forKey: "name")
        object.setValue(textDate.text, forKey: "date")
        object.setValue(textMeomo.text, forKey: "memo")
        object.setValue(Date(), forKey: "saveDate")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        // 현재의 View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
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
