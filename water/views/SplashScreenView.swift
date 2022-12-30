//
//  SplashScreenView.swift
//  wasser
//
//  Created by Daniel Kagemann on 28.12.22.
//

import SwiftUI

struct SplashScreenView: View {
   
   @State private var isActive: Bool = false
   @State private var size: Double = 0.5
   @State private var opacity = 0.2
   
   var body: some View {
      if isActive {
         ContentView()
      } else {
         VStack {
            VStack {
               Image("waterlogo")
                  .resizable()
                  .frame(width:200, height:250)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
               withAnimation(.easeInOut(duration: 1.2)) {
                  size = 0.9
                  opacity = 1.0
               }
            }
         }
         .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
               isActive = true
            })
         }
      }
   }
}

struct SplashScreenView_Previews: PreviewProvider {
   static var previews: some View {
      SplashScreenView()
   }
}
