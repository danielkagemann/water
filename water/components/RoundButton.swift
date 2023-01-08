//
//  RoundButton.swift
//  wasser
//
//  Created by Daniel Kagemann on 28.12.22.
//

import SwiftUI

struct RoundButton: View {
   
   @State private var tapped:Bool = false
   
   var text: String
   var action: () -> Void
   var size: Int = 52
   
   var body: some View {
      ZStack {
         Rectangle()
            .frame(width: CGFloat(size),height: CGFloat(size))
            .cornerRadius(CGFloat(size))
            .foregroundColor(tapped ? .blue : .gray)
            .onTapGesture {
               tapped.toggle()
               action()
               DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                  tapped = false
               }
            }
            .scaleEffect(tapped ? 1.3 : 1)
            .animation(tapped ? .spring(response: 0.4, dampingFraction: 0.6) : .none)
         Text(text).foregroundColor(.white).font(.callout)
      }
   }
}

struct RoundButton_Previews: PreviewProvider {
   static var previews: some View {
      RoundButton(text: "test", action: {})
   }
}
