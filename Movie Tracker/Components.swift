//
//  Components.swift
//  Movie Tracker
//
//  Created by Vasilis Green on 18/1/20.
//  Copyright © 2020 Vasilis Green. All rights reserved.
//

import SwiftUI

struct Components: View {

      var body: some View {
  //      every time we hava a view or a text or an image
  //      and we provide a dot . after it
  //      this is called a modifier
  //      ex. Text("Hello World!").forgroundcolor(.red)
  //      will change the color of the text to red
        
  //      TO SEE ALL THE MODIFIERS AND VIEWS AND OTHER THINGS THAT SWIFTUI OFFERS
  //      Click the plus + sign at the top right corner
        
  //      THE ORDER OF THE MODIFIERS MATERS
  //      adding padding after background will add padding outside of the background colored box
  //      adding it before will add pading between the text and the background colored box
  //      it works like a a javascript order i.e. executes your comands "one at a time" starting from the top
        
        VStack(){
          
          Text("hello world hahahahahahahahahah")
            .autocapitalization(.words)
            .truncationMode(.tail)
            .font(.title)
            .lineLimit(1)
            .padding(10)
            .background(Color.green)
            .cornerRadius(15, antialiased: true)
            .padding()
            .background(Image("horizontal"))
            .cornerRadius(5, antialiased: true)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
          
  //      can use array to pass more then one attributes to a modifier
          Image("vertical").resizable().aspectRatio(contentMode: .fit)
          
          
          HStack(){
          Text("This is a lightbulb!")
  //      SF SYMBOLS
  //      apple system icons to use
          Image(systemName: "lightbulb")
          Spacer()
          Text("swiftUi")
          }
          
          
  //      zstack places content on top of each other
  //      something like absolute positioning it inside it
  //      but still holds its alignment properties
          ZStack(){
            Image("horizontal").resizable().aspectRatio(contentMode: .fit)
            Image(systemName: "play.fill").resizable().foregroundColor(.red).aspectRatio(contentMode: .fit).frame(width:50,height:50).shadow(radius: 10)
          }

          
        }
      }
}

struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Components()
    }
}
