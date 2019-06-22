//
//  DetailViewController.swift
//  Calendar_test
//
//  Created by 백유진 on 20/06/2019.
//  Copyright © 2019 백유진. All rights reserved.
//


import UIKit
import CoreData


class DetailViewController: UIViewController {
    
    @IBOutlet var textName: UITextField!
    @IBOutlet var textDate: UITextField!
    @IBOutlet var textMeomo: UITextField!
    @IBOutlet var saveDate: UITextField!
    
    var detailCalendars: NSManagedObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let calendar = detailCalendars {
            textName.text = calendar.value(forKey: "name") as? String
            textDate.text = calendar.value(forKey: "date") as? String
            textMeomo.text = calendar.value(forKey: "memo") as? String
            let dbDate: Date? = calendar.value(forKey: "saveDate") as? Date
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd h:mm a"
            if let unwrapDate = dbDate {
                saveDate.text = formatter.string(from: unwrapDate as Date) }
        }
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
