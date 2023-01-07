//
//  RealmHelper.swift
//  water
//
//  Created by Daniel Kagemann on 07.01.23.
//

import Foundation
import RealmSwift

func filterByDate (list: Query<Any>, date: Date)->Any {
   let cal = Calendar.current
   
   //testDate being the date you want to check for
   let startDate = cal.startOfDay(for: date)
   let endDate = cal.date(byAdding: .day, value: 1, to: startDate)!
   
  
   let filtered = list.where {
      $0.date >= startDate && $0.date < endDate
   }
   
   return filtered.map { $0 }
}
