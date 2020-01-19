//
//  MovieModel.swift
//  Movie Tracker
//
//  Created by Vasilis Green on 19/1/20.
//  Copyright © 2020 Vasilis Green. All rights reserved.
//

import Foundation

// anytime you're listing an array, this array needs to be indentifiable
// like react is using keys for the items in a flatlist
struct MovieModel: Identifiable {
  
  var id = UUID()
  var titleMovie = ""
  var ratingMovie = 3.0
  var seenMovie = false
  
}
