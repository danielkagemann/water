//
//  ContentView.swift
//  wasser
//
//  Created by Daniel Kagemann on 28.12.22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
   
   @ObservedResults(Water.self, filter: isToday()) var waterList
   
   @State private var showingSheet = false
   
   var goal: Int = 2000
   
   private func valueForToday () -> Int {
      return waterList.reduce(0, { acc, curr in
         acc + curr.amount
      })
   }
   
   private func add (amount:Int) -> Void {
      let item = Water(amount: amount)
      $waterList.append(item)
   }
   
   var body: some View {
      NavigationView {
         VStack {
            // show current consumption
            VStack {
               HStack (spacing:0) {
                  Text("\(valueForToday())").font(.system(size: 64, weight: .bold)).animation(.spring())
                  Text("ml").font(.system(size: 64, weight: .light))
               }
               Text(valueForToday() > goal ? "Tagesziel erreicht (+\(valueForToday()-goal)ml)" : "noch \(goal - valueForToday())ml")
               
               HStack {
                  RoundButton(text: "100", action: {
                     self.add(amount: 100)
                  })
                  RoundButton(text: "200", action: {
                     self.add(amount: 250)
                  })
                  RoundButton(text: "500", action: {
                     self.add(amount: 500)
                  })
               }
               
            }
            
            TodayView()
         }
         .navigationBarItems(
            leading:
               Image(systemName: "drop")
               .foregroundColor(.blue)
               .onTapGesture {
                  showingSheet.toggle()
               }
               .sheet(isPresented: $showingSheet) {
                  SettingsView()
               }
            
         )
      }
   }
   
   struct ContentView_Previews: PreviewProvider {
      static var previews: some View {
         ContentView()
      }
   }
}
