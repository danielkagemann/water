//
//  TodayView.swift
//  wasser
//
//  Created by Daniel Kagemann on 29.12.22.
//

import SwiftUI
import RealmSwift
import SwiftDate

struct DetailListView: View {
   
   var list: [Water]
   var action: (_ uuid: ObjectId) ->Void
   
   func mapAmountToImage (value: Int) -> String {
      if value == 100 {
         return "image.drop"
      }
      if  value == 200 {
         return "image.glas"
      }
      return "image.bottle"
   }
   
   var body: some View {
      VStack (alignment: .leading) {
         List {
            ForEach (list, id: \.id) { water in
               HStack {
                  Image(mapAmountToImage(value: water.amount)).scaleEffect(0.5)
                  Text("\(water.amount)") + Text("ml").bold()
                  Spacer()
                  Text(water.date.toFormat("HH:mm"))
                     .foregroundColor(.gray)
                     .font(.callout)
               }
            }
            .onDelete(perform: { indexes in
               let id = indexes.first ?? -1
               if id != -1 {
                  let uuid = list[id].id
                  action(uuid)
               }
            })
         }
         .environment(\.locale, Locale(identifier: "de"))
         .listStyle(.plain)
         .listSectionSeparator(.hidden)
         .listRowSeparator(.hidden)
      }
   }
}

struct DetailListView_Previews: PreviewProvider {
   static var previews: some View {
      DetailListView(list: [Water(amount: 100), Water(amount: 200)], action: {uuid in })
   }
}
