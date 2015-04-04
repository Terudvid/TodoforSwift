//
//  EditViewController.swift
//  Todoapps
//
//  Created by TelTT on 2015/04/02.
//  Copyright (c) 2015年 Teruyuki Tomokane. All rights reserved.
//

import UIKit
import CoreData

class EditViewController: UIViewController {
    
    var memoField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyanColor()
        self.title = "Edit"
        
        //text field
        memoField = UITextField(frame: CGRectMake(100, 100, 200, 30))
        memoField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(memoField)
        
        //write button
        let writeBtn: UIButton = UIButton(frame: CGRectMake(100, 150, 200, 30))
        writeBtn.backgroundColor = UIColor.magentaColor()
        writeBtn.setTitle("メモを保存", forState: UIControlState.Normal)
        writeBtn.addTarget(self, action: "writeData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(writeBtn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func writeData(){
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let toDoContext: NSManagedObjectContext = appDel.managedObjectContext!
        let toDoEntity: NSEntityDescription! = NSEntityDescription.entityForName("ToDoStore", inManagedObjectContext: toDoContext)
        var newData = Entity(entity: toDoEntity, insertIntoManagedObjectContext: toDoContext)
        newData.memo = memoField.text
        newData.data = NSDate()
    }
}
