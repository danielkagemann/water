//
//  Goal.swift
//  water
//
//  Created by Daniel Kagemann on 07.01.23.
//

import Foundation
import RealmSwift


class Goal: Object, Identifiable {
   @Persisted(primaryKey: true) var id: ObjectId
   @Persisted var date: Date
   @Persisted var goal: Int
   
   override class func primaryKey() -> String? {
      "id"
   }
   
   convenience init(date: Date, value: Int) {
      self.init()
      self.date = date
      self.goal = value
   }
}
