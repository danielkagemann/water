//
//  DateHelper.swift
//  water
//
//  Created by Daniel Kagemann on 30.12.22.
//

import Foundation

func smartDate (date: Date) -> String {
   if date.compare(.isToday) {
      return "Heute";
   }
   if date.compare(.isTomorrow) {
      return "Morgen";
   }
   if date.compare(.isYesterday) {
      return "Gestern";
   }
   
   return date.toFormat("dd.MM.yyyy");
}
