//
//  Water.swift
//  wasser
//
//  Created by Daniel Kagemann on 29.12.22.
//

import Foundation
import RealmSwift


class Water: Object, Identifiable {
   @Persisted(primaryKey: true) var id: ObjectId
   @Persisted var date: Date
   @Persisted var amount: Int
   
   override class func primaryKey() -> String? {
      "id"
   }
   
   convenience init(amount: Int) {
      self.init()
      self.date = Date()
      self.amount = amount
   }
}
