//
//  MovieList.swift
//  Movie Tracker
//
//  Created by Vasilis Green on 19/1/20.
//  Copyright © 2020 Vasilis Green. All rights reserved.
//

import SwiftUI

struct MovieList: View {
  
  var movies = [
    MovieModel(),
    MovieModel(),
    MovieModel()
  ]
  
  var body: some View {
    // anytime you're listing an array, this array needs to be indentifiable
    // like react is using keys for the items in a flatlist
    NavigationView{
      List(movies){ currentMovie in
        NavigationLink(destination: MovieDetail(movie: currentMovie)){
          Text(currentMovie.titleMovie)
        }
      }
      .navigationBarTitle("Movies")
      .navigationBarItems(trailing:
        NavigationLink(destination: MovieDetail(movie: MovieModel())){
          Image(systemName: "plus")
        }
      )
    }
  }
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    MovieList()
  }
}
