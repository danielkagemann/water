//
//  TodayView.swift
//  wasser
//
//  Created by Daniel Kagemann on 29.12.22.
//

import SwiftUI
import RealmSwift

struct TodayView: View {
   
   @ObservedResults(Water.self, filter: isToday()) var waterList
   
    var body: some View {
       VStack (alignment: .leading) {
          List {
             Text("Heute").bold()
             ForEach (waterList, id: \.id) { water in
                HStack {
                      Image(systemName: water.amount == 100 ? "drop" : "wineglass").foregroundColor(.blue).padding()
                      Text("\(water.amount)") + Text("ml").bold()
                   Spacer()
                   Text(onlyTime(date: water.date))
                      .foregroundColor(.gray)
                      .font(.callout)
                }
             }
             .onDelete(perform: $waterList.remove)
          }
          .listRowSeparator(.hidden)
          .listStyle(.plain)
       }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
