//
//  SettingsView.swift
//  water
//
//  Created by Daniel Kagemann on 29.12.22.
//

import SwiftUI
import RealmSwift

struct SettingsView: View {
   @Environment(\.dismiss) var dismiss
   @State var date: Date = Date()
   @State var goal: Double = 1200
   
   @ObservedResults(Goal.self) var goalList
   
   var body: some View {
      NavigationView {
         
         Form {
            Section {
               VStack {
                  Text("Tägliche Wassermenge in ml")
                  
                  Slider(value: $goal, in: 0...4000, step: 10)
                  Text("\(Int(goal))ml")
                  
               }
            }
            Section {
               
               VStack {
                  Text("Gültig ab")
                  DatePicker ("", selection: $date, in: Date()..., displayedComponents: .date)
                     .datePickerStyle(GraphicalDatePickerStyle())
               }
            }
            HStack {
               Button("Abbrechen") {
                  dismiss()
               }
               Spacer()
               
               Button("Übernehmen") {
                  let item = Goal(date: date, value: Int(goal))
                  $goalList.append(item)
                  dismiss()
               }
            }
         }.navigationTitle("Einstellungen")
      }
   }
}

struct SettingsView_Previews: PreviewProvider {
   static var previews: some View {
      SettingsView()
   }
}
