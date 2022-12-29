//
//  TimeFormat.swift
//  wasser
//
//  Created by Daniel Kagemann on 28.12.22.
//

import Foundation

func calcTimeSince(date: Date) -> String {
   let minutes = Int(-date.timeIntervalSinceNow)/60
   let hours = minutes/60
   let days = hours/24
   
   if minutes < 1 {
      return "gerade eben"
   }
   if minutes < 60 {
      return "vor \(minutes) Minuten"
   }
   
   if minutes < 120 {
      return "vor \(minutes) Minuten"
   } else if minutes >= 120 && hours < 48 {
      return "vor \(hours) Stunden";
   } else {
      return "vor \(days)"
   }
}

func onlyTime(date: Date) -> String {
   return date.formatted(
      Date.FormatStyle()
         .hour(.conversationalTwoDigits(amPM: .wide))
         .minute(.twoDigits)
         .locale(Locale(identifier: "de_DE"))
   )
}

func isToday() -> NSPredicate {
   let cal = Calendar.current
   
   var today: Date = Date()

   //testDate being the date you want to check for
   let startDate = cal.startOfDay(for: today)
   let endDate = cal.date(byAdding: .day, value: 1, to: startDate)

   //assuming date is the name of your Core Data attribute
   return NSPredicate(format: "date >= %@ AND date < %@", startDate as CVarArg, endDate! as CVarArg)
}
