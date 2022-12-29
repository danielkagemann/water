//
//  SettingsView.swift
//  water
//
//  Created by Daniel Kagemann on 29.12.22.
//

import SwiftUI

struct SettingsView: View {
   @Environment(\.dismiss) var dismiss

    var body: some View {
       Button("Press to dismiss") {
                   dismiss()
               }
               .font(.title)
               .padding()
               .background(.black)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
