//
//  ViewController.swift
//  Todoapps
//
//  Created by TelTT on 2015/03/15.
//  Copyright (c) 2015年 Teruyuki Tomokane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, U {
    
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
        self.view.addView(table)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

