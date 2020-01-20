//
//  MovieModel.swift
//  Movie Tracker
//
//  Created by Vasilis Green on 19/1/20.
//  Copyright © 2020 Vasilis Green. All rights reserved.
//

import Foundation

// anytime you're listing(using it in a list) an array, this array needs to be indentifiable
// like react is using keys for the items in a flatlist
struct MovieModel: Identifiable {
  var id = UUID()
  var titleMovie = ""
  var ratingMovie = 3.0
  var seenMovie = false
}

// An observed object is a way to share values within the app
//needs to conform to the ObservableObject protocol
class MovieStorage: ObservableObject {
  
  // init an empty array that will be filled with MovieMode objects\
  //  @Published makes the array Observable by SwiftUI (any time changes are made to this array swiftUI will know)
  @Published var movies = [MovieModel]()
  
  
// in here we would use core data or some other way to save our data 
  
  
}
