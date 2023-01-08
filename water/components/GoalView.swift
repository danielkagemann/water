//
//  GoalView.swift
//  water
//
//  Created by Daniel Kagemann on 07.01.23.
//

import SwiftUI

struct GoalView: View {
   
   var date: Date
   var value: Double
   
   var body: some View {
      HStack {
         if value == 0 {
            Text("noch keine Tagesmenge angegeben")
         } else {
            Text("seit \(date.toFormat("dd.MM.yyyy")) Tagesmenge \(Int(value))ml")
         }
         Spacer()
      }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
   }
}

struct GoalView_Previews: PreviewProvider {
   static var previews: some View {
      GoalView(date: Date(), value: 1000)
   }
}
