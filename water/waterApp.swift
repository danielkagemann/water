//
//  wasserApp.swift
//  wasser
//
//  Created by Daniel Kagemann on 28.12.22.
//

import SwiftUI

@main
struct waterApp: SwiftUI.App {

   var body: some Scene {
      WindowGroup {
         SplashScreenView()
            .onAppear {
               print (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
               // UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            }
      }
   }
}
