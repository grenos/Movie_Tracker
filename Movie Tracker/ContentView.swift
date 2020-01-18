//
//  ContentView.swift
//  Movie Tracker
//
//  Created by Vasilis Green on 18/1/20.
//  Copyright © 2020 Vasilis Green. All rights reserved.
//

import SwiftUI


struct ContentView: View {
  
  @State var titleMovie = ""
  @State var ratingMovie = 3.0
  @State var seenMovie = false
  
  var body: some View {
    List {
      Section {
        TextField("Movie Title", text: $titleMovie)
      }
      
      Section {
        SectionTitle(title: "Rating")
        // put stars in HStack
        HStack(){
          // two spacer make the stars center
          Spacer()
          // ake value from rating var and print number of stars for value
          Text(String(repeating:"★", count: Int(ratingMovie) ))
            .foregroundColor(.yellow)
            .font(.title)
          Spacer()
        }
        Slider(value: $ratingMovie, in: 1...5, step:1)
      }
      
      Section {
        SectionTitle(title: "Seen")
        // works like a button -- we need to pass a state var as a bool
        Toggle(isOn: $seenMovie) {
          if titleMovie == "" {
             Text("I have seen this movie?").font(.body)
          } else {
            Text("I have seen " + String(titleMovie)).font(.body)
          }
         
        }
      }
      
      Section {
        Button(action: {}){
          HStack {
            Spacer()
            Text("Save")
            Spacer()
          }
        }
      }
      
    }.listStyle(GroupedListStyle())
    
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct SectionTitle: View {
  var title : String
  var body: some View {
    Text(title).font(.caption).foregroundColor(.gray)
  }
}
