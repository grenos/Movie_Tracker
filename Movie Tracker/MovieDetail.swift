//
//  ContentView.swift
//  Movie Tracker
//
//  Created by Vasilis Green on 18/1/20.
//  Copyright © 2020 Vasilis Green. All rights reserved.
//

import SwiftUI


struct MovieDetail: View {
  
  //  THERE ARE 3 WAYS TO SAVE AND PASS DATA AROUND
  //  1) @State
  //  2) Object Binding
  //  3) Environment Object
  
  //  FOR STATE
  //  use the $ dollar sign to update state ($movie.titleMovie)
  //  use the name of the object to read values from state (movie.titleMovie)
  //  use the "private" flag before declaring the var to make this state available only in this View
  
  @State var movie: MovieModel
  //  We instruct SwiftUI to observe the MovieStorage class for changes
  //  We use the @ObservedObject here and  --NOT-- the @ObservableObject
  //  We can copy paste this to any other component if we want to share it with that component
//  @ObservedObject var movieStorage : MovieStorage
  
//  make SwiftUi know that we want to observe the EnvironmentObject
  @EnvironmentObject var movieStorage : MovieStorage
  let newMovie : Bool
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    List {
      Section {
        TextField("Movie Title", text: $movie.titleMovie)
      }
      
      Section {
        SectionTitle(title: "Rating")
        // put stars in HStack
        HStack(){
          // two spacer make the stars center
          Spacer()
          // ake value from rating var and print number of stars for value
          Text(String(repeating:"★", count: Int(movie.ratingMovie) ))
            .foregroundColor(.yellow)
            .font(.title)
          Spacer()
        }
        Slider(value: $movie.ratingMovie, in: 1...5, step:1)
      }
      
      Section {
        SectionTitle(title: "Seen")
        // works like a button -- we need to pass a state var as a bool
        Toggle(isOn: $movie.seenMovie) {
          
          if  movie.seenMovie == true {
            Text("Hell yeah I've seen it!").font(.body)
          } else {
            Text("I have seen ... " + String(movie.titleMovie)).font(.body)
          }
          
        }
      }
      
      Section {
        Button(action: {
          if self.newMovie {
            self.movieStorage.movies.append(self.movie)
          } else {
            // here goes the array of added movies
            for i in 0..<self.movieStorage.movies.count {
              // we search through it to find the one we clikced
              if self.movieStorage.movies[i].id == self.movie.id {
                // and we update the info
                self.movieStorage.movies[i] = self.movie
              }
            }
          }
          // dismish current View (like react navigation goBack)
          self.presentationMode.wrappedValue.dismiss()
          
        }){
          HStack {
            Spacer()
            Text("Save")
              .font(.title)
              .padding(.vertical)
            Spacer()
          }
        }.disabled(movie.titleMovie.isEmpty)
      }
      
    }.listStyle(GroupedListStyle())
    
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetail(movie: MovieModel(), newMovie: true)
  }
}

struct SectionTitle: View {
  var title : String
  var body: some View {
    Text(title).font(.caption).foregroundColor(.blue)
  }
}
