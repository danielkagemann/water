//
//  ChartView.swift
//  water
//
//  Created by Daniel Kagemann on 07.01.23.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
   
   var data: [Double]
   
   var body: some View {
   
      LineChart()
         .data(data)
         .chartStyle(.init(backgroundColor: .white, foregroundColor: ColorGradient(.blue, .white)))
         .frame(height:100)
   }
}

struct ChartView_Previews: PreviewProvider {
   static var previews: some View {
      ChartView(data: [100,70,50,75,80,120])
   }
}
