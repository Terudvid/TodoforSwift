//
//  ViewController.swift
//  Todoapps
//
//  Created by TelTT on 2015/03/15.
//  Copyright (c) 2015年 Teruyuki Tomokane. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //ナビバーの右上ボタンを用意
    var addBtn:UIBarButtonItem!
    
    //テーブルを用意
    var table: UITableView!
    
    // テーブルを表示するアイテムを用意
    var memos: [NSString] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        addBtn = UIBarButtonItem(barButtonSystemItem: .Add, target:self, action: "onclick")
        self.navigationItem.rightBarButtonItem = addBtn
        
        let width: CGFloat! = self.view.bounds.width
        let height: CGFloat! = self.view.bounds.height
        
        table = UITableView(frame: CGRectMake(0, 0, width, height))
        table.registerClass(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: "data")
        table.dataSource = self
        table.delegate = self
        self.view.addSubview(table)
        
    }

    override func viewWillAppear(animated: Bool) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let toDoContext: NSManagedObjectContext = appDel.managedObjectContext!
        let toDoRequest: NSFetchRequest = NSFetchRequest(entityName: "Entity")
        
        toDoRequest.sortDescriptors = [NSSortDescriptor(key: "data", ascending: true)]
        toDoRequest.returnsObjectsAsFaults = false
        var results = toDoContext.executeFetchRequest(toDoRequest, error: nil) as [Entity]!
        memos = []
        for data in results{
            memos.append(data.memo)
        }
        self.table.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("data", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = memos[indexPath.row]
        return cell
    }


}

