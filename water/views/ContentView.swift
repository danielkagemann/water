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
   
   // starting always today
   @State var selectedDate: Date = Date()
   
   // get ALL results from realm
   @ObservedResults(Water.self) var waterList
   
   // get all defined GOALS
   @ObservedResults(Goal.self, sortDescriptor: SortDescriptor(keyPath: "date")) var goalList
   
   // show settings sheet
   @State private var showingSheet = false
      
   // get goal for selected date
   var goalFor: Goal? {
      let cal = Calendar.current
      
      //testDate being the date you want to check for
      let startDate = cal.startOfDay(for: selectedDate)
      let endDate = cal.date(byAdding: .day, value: 1, to: startDate)!
      
      // startdate and enddate is selecteddate
      let flt = goalList.where {
         $0.date <= endDate
      }
      return flt.map { $0 }.last
   }
   
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

               // display liquid with some data
               AmountView(value: totalAmount(), goal: goalFor?.goal ?? 0)
               
               // action panel
               HStack (alignment: .center){
                  Button(action: {
                     selectedDate = selectedDate - 1.days
                  }, label: {
                     Image(systemName: "chevron.backward")
                  }).padding()

                  IconButton(icon: "image.drop", text: "100", action: {
                     self.add(amount: 100)
                  })
                  IconButton(icon: "image.glas", text: "200", action: {
                     self.add(amount: 200)
                  })
                  IconButton(icon: "image.bottle", text: "500", action: {
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
         
            // the list
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
               Image(systemName: "gear")
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
