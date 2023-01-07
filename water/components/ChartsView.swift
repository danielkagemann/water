//
//  ChartsView.swift
//  water
//
//  Created by Daniel Kagemann on 07.01.23.
//

import SwiftUI
import RealmSwift

struct ChartsView: View {
   @ObservedResults(Water.self) var waterList
   
   // get the last 5 days
   private func lastDays () -> [Double] {
      
      return [200,140,400,200,120]
   }
   
   var barSize = UIScreen.main.bounds.width / 5
   var highestData: Double {
      var max = 1.0;
      let data = lastDays();
      
      for value in data {
         max = value > max ? value : max;
      }
      return max
   }
   
   var body: some View {
      ZStack {
         HStack (alignment: .bottom){
            ForEach(lastDays().indices, id: \.self) { index in
               
               let height = 300 * lastDays()[index] / highestData
               
               Rectangle()
                  .fill(.tint)
                  .frame(width: barSize, height: height, alignment: .bottom)
            }
         }
         .position(x:UIScreen.main.bounds.width/2,y:UIScreen.main.bounds.height - 150)
      }
      .ignoresSafeArea()
   }
}

struct ChartsView_Previews: PreviewProvider {
   static var previews: some View {
      ChartsView()
   }
}
