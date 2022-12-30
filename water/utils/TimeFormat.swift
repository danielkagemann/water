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

func onlyDate(date: Date) -> String {
   return date.formatted(.dateTime.day().month().year())
}

func onlyTime(date: Date) -> String {
   return date.formatted(
      Date.FormatStyle()
         .hour(.conversationalTwoDigits(amPM: .wide))
         .minute(.twoDigits)
         .locale(Locale(identifier: "de_DE"))
   )
}

