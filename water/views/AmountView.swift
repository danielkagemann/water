//
//  AmountView.swift
//  water
//
//  Created by Daniel Kagemann on 30.12.22.
//

import SwiftUI
import Liquid

struct AmountView: View {
   var  value: Int
   var goal: Int
   
   var body: some View {
      ZStack {
         Liquid()
            .frame(width: 240, height: 240)
            .foregroundColor(.blue)
            .opacity(0.3)
         
         Liquid()
            .frame(width: 220, height: 210)
            .foregroundColor(.blue)
            .opacity(0.6)
         
         Liquid(samples: 5)
            .frame(width: 200, height: 200)
            .foregroundColor(.blue)
         
         VStack {
            HStack {
               Text("\(value)").font(.largeTitle).foregroundColor(.white).bold()
               Text("ml").font(.largeTitle).foregroundColor(.white)
            }
            Text(value > goal ? "Tagesziel erreicht (+\(value-goal)ml)" : "noch \(goal - value)ml").foregroundColor(.white).opacity(0.5)
         }
      }
   }
}

struct AmountView_Previews: PreviewProvider {
   static var previews: some View {
      AmountView(value:1000, goal:2000)
   }
}
