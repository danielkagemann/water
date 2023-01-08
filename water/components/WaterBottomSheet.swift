//
//  WaterBottomSheet.swift
//  water
//
//  Created by Daniel Kagemann on 08.01.23.
//

import SwiftUI

struct WaterBottomSheet: View {
   @State var value: Double = 100
   @Environment(\.dismiss) var dismiss
   
   var action: (_ value: Double) -> Void
   
   var body: some View {
      NavigationView {
         
         Form {
            Section {
               VStack {
                  Text("Wieviel ml?")
                  Slider(value: $value, in: 0...500, step: 10)
                  Text("\(Int(value))ml")
               }.padding()
            }
            
            Section {
               VStack {
                  Text("oder wähle hier direkt aus")
                  HStack {
                     RoundButton(text: "20", action: {
                        value=20
                     })
                     RoundButton(text: "50", action: {
                        value=50
                     })
                     RoundButton(text: "100", action: {
                        value=100
                     })
                     RoundButton(text: "200", action: {
                        value=200
                     })
                  }
               }
            }
            
            HStack  {
               Button("Abbrechen") {
                  dismiss()
               }
               Spacer()
               
               Button("Übernehmen") {
                  action(value)
                  dismiss()
               }
            }
         }
         .navigationTitle("Menge hinzufügen")
      }
   }
}

struct WaterBottomSheet_Previews: PreviewProvider {
   static var previews: some View {
      WaterBottomSheet(action: {value in
         print(value)
      })
   }
}

