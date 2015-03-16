//
//  Entity.swift
//  Todoapps
//
//  Created by TelTT on 2015/03/15.
//  Copyright (c) 2015年 Teruyuki Tomokane. All rights reserved.
//

import Foundation
import CoreData

class Entity: NSManagedObject {

    @NSManaged var data: NSDate
    @NSManaged var memo: String

}
