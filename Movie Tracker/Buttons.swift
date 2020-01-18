//
//  Buttons.swift
//  Movie Tracker
//
//  Created by Vasilis Green on 18/1/20.
//  Copyright © 2020 Vasilis Green. All rights reserved.
//

import SwiftUI

struct Buttons: View {
  
  func hello(){
    print("Hello")
  }
  
  
  var body: some View {
    
    
    //        ZStack(){
    //            Image("horizontal").resizable().aspectRatio(contentMode: .fit)
    //            Button(action: hello) {
    //              Image(systemName: "play.fill")
    //                .resizable().foregroundColor(.red).aspectRatio(contentMode: .fit).frame(width:50,height:50).shadow(radius: 10)
    //            }
    //          }
    
    
    Button (action: {}){
      HStack {
        Text("Tap Me")
        Image(systemName: "gamecontroller")
      }
    }.padding().background(Color.yellow).cornerRadius(10)
    
  }
}

struct Buttons_Previews: PreviewProvider {
  static var previews: some View {
    Buttons()
  }
}
