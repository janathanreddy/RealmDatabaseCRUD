//
//  Todo.swift
//  RealmCrudFunctions
//
//  Created by Janarthan Subburaj on 12/01/21.
//

import Foundation
import RealmSwift

class Todo_Attributes: Object{
    @objc dynamic var Task_Name:String?
    @objc dynamic var Sort_Date:Date?
    @objc dynamic var Task_Date:String?
    @objc dynamic var Task_Notes:String?
    
}
