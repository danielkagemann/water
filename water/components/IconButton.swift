//
//  IconButton.swift
//  wasser
//
//  Created by Daniel Kagemann on 28.12.22.
//

import SwiftUI

struct IconButton: View {
   
   @State private var tapped:Bool = false
   
   var icon: String
   var text: String
   var action: () -> Void
   
   var body: some View {
      VStack {
         Button(action: {
            tapped.toggle()
            action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
               tapped = false
            }
         }, label: {
            VStack {
               Image(icon).fixedSize(horizontal: true, vertical: true)
                  .scaleEffect(tapped ? 1.3 : 0.8)
                  .rotationEffect(Angle(degrees: tapped ? 15 : 0))
                  .animation(tapped ? .spring(response: 0.4, dampingFraction: 0.6) : .none)
               
               Text(text).foregroundColor(.blue).font(.callout).opacity(tapped ? 0 : 1)
            }
         }
         )
      }
   }
}

struct IconButton_Previews: PreviewProvider {
   static var previews: some View {
      IconButton(icon: "image.glas", text: "test", action: {})
   }
}
