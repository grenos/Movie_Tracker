//
//  MovieList.swift
//  Movie Tracker
//
//  Created by Vasilis Green on 19/1/20.
//  Copyright © 2020 Vasilis Green. All rights reserved.
//

import SwiftUI

struct MovieList: View {
  
  //  We instruct SwiftUI to observe the MovieStorage class for changes
  //  We use the @ObservedObject here and  --NOT-- the @ObservableObject
  //  We can copy paste this to any other component if we want to share it with that component
  //  HERE THE PROBLEM is that we need to pass and create the object in any component we want to use it
  //  @ObservedObject var movieStorage = MovieStorage()
  
  // INSTEAD WE CAN USE AN @ENVIRONMENT OBJECT to make available the data to the entire app
  //  the setup of this to ACCESSIBLE to the app is at the SceneDelegate FILE
  //  NEED to have CORE DATA enabled at the begining of the project
  @EnvironmentObject var movieStorage : MovieStorage
  
  
  var body: some View {
    // anytime you're listing(using it on a list) an array, this array needs to be indentifiable
    // like react is using keys for the items in a flatlist
    NavigationView{
      List(movieStorage.movies){ currentMovie in
        NavigationLink(destination: MovieDetail(movie: currentMovie, newMovie: false)){
          Text(currentMovie.titleMovie)
        }
      }
      .navigationBarTitle("Movies")
      .navigationBarItems(trailing:
        NavigationLink(destination: MovieDetail(movie: MovieModel(), newMovie: true)){
          Image(systemName: "plus")
        }
      )
    }
  }
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    MovieList().environmentObject(MovieStorage())
  }
}
