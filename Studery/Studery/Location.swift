//
//  Location.swift
//  Studery
//
//  Created by Eunice Cho on 11/21/22.
//

import Foundation

//class Location {
//    var imageName: String
//    init (imageName: String) {
//        self.imageName = imageName
//    }
//}

struct Location: Codable {
    let id: String
    var name: String
    var imageName: String
}

struct LocationResponse: Codable {
    let success: Bool
    let data: [Location]
}

// MARK: TODO - Fill this file in with models to properly decode the JSON responses from the server
//class Post {
//    let id: Int
//    let title: String
//    let body: String
//    let poster: String
//    let timestamp: String
//
//    init(id: Int, title: String, body: String, poster: String, timestamp: String) {
//        self.id = id
//        self.title = title
//        self.body = body
//        self.poster = poster
//        self.timestamp = timestamp
//    }
//}

