//
//  ContentView.swift
//  wasser
//
//  Created by Daniel Kagemann on 28.12.22.
//

import SwiftUI
import RealmSwift
import SwiftDate

struct ContentView: View {
   // the daily goal
   var goal: Int = 2000
   
   // starting always today
   @State var selectedDate: Date = Date()
   
   // get ALL results from realm
   @ObservedResults(Water.self) var waterList
   
   // show goal sheet
   @State private var showingSheet = false
   
   // filter ALL results by selected date (state)
   var filteredWater: [Water] {
      let cal = Calendar.current
      
      //testDate being the date you want to check for
      let startDate = cal.startOfDay(for: selectedDate)
      let endDate = cal.date(byAdding: .day, value: 1, to: startDate)!
      
      let filtered = waterList.where {
         $0.date >= startDate && $0.date < endDate
      }
      
      return filtered.map { $0 }
   }
   
   // get value for selected day
   private func totalAmount () -> Int {
      return filteredWater.reduce(0, { acc, curr in
         acc + curr.amount
      })
   }
   
   // add new item to list
   private func add (amount:Int) -> Void {
      let item = Water(amount: amount)
      $waterList.append(item)
   }
   
   var body: some View {
      NavigationView {
         VStack {
            // show current consumption
            VStack {
              
               HStack {
                  Text("\(totalAmount())").font(.system(size: 64, weight: .bold)).animation(.spring())
                  Text("ml").font(.system(size: 64, weight: .light))
               }
               Text(totalAmount() > goal ? "Tagesziel erreicht (+\(totalAmount()-goal)ml)" : "noch \(goal - totalAmount())ml")
               
               HStack {
                  Button(action: {
                     selectedDate = selectedDate - 1.days
                  }, label: {
                     Image(systemName: "chevron.backward")
                  }).padding()
                  
                  RoundButton(text: "100", action: {
                     self.add(amount: 100)
                  })
                  RoundButton(text: "200", action: {
                     self.add(amount: 250)
                  })
                  RoundButton(text: "500", action: {
                     self.add(amount: 500)
                  })
                  
                  Button(action: {
                     selectedDate = selectedDate + 1.days
                  }, label: {
                     Image(systemName: "chevron.forward")
                  }).padding()
               }
            }
            .frame(width: .infinity, height: UIScreen.main.bounds.height/2)
            
            DetailListView(list: filteredWater, action: {uuid in
               // find uuid in list
               let match = waterList.where {
                  $0.id == uuid
               }
               
               $waterList.remove(match.first!)
            })
         }
         .navigationTitle(smartDate(date: selectedDate))
         .navigationBarItems(
            trailing:
               Image(systemName: "bell")
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
