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
   
    var body: some View {
       VStack (alignment: .leading) {
          List {
             ForEach (list, id: \.id) { water in
                HStack {
                      Image(systemName: water.amount == 100 ? "drop" : "wineglass").foregroundColor(.blue).padding()
                      Text("\(water.amount)") + Text("ml").bold()
                   Spacer()
                   Text(water.date.toFormat("HH:mm"))
                      .foregroundColor(.gray)
                      .font(.callout)
                }
             }
             .onDelete(perform: { id in
                print ("you killed id \(id)")
             })
             // $waterList.remove
          }
          .listSectionSeparator(.hidden)
          .listStyle(.plain)
          .listRowSeparator(.hidden)
       }
    }
}

struct DetailListView_Previews: PreviewProvider {
    static var previews: some View {
       DetailListView(list: [Water(amount: 100), Water(amount: 200)])
    }
}
