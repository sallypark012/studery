//
//  NetworkManager.swift
//  Studery
//
//  Created by David Kim on 11/23/22.
//

import Alamofire
import Foundation

class NetworkManager {

    // TODO: Change the host URL to the correct backend API
    static let host = "https://ios-course-message-board.herokuapp.com"

    // GET Request for all study locations
    static func getAllLocations(completion: @escaping ([Location]) -> Void) {
        // TODO: Change the endpoint
        let endpoint = "\(host)/posts/all/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode([Location].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllLocations")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


//    static func createPost(title: String, body: String, poster: String, completion: @escaping (Post) -> Void) {
//        let endpoint = "\(host)/posts/"
//        let params: Parameters = [
//            "poster": poster,
//            "body": body,
//            "title": title
//        ]
//        AF.request(endpoint, method: .post, parameters: params).validate().responseData { response in
//            switch response.result {
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                jsonDecoder.dateDecodingStrategy = .iso8601
//                if let userResponse = try? jsonDecoder.decode([Post].self, from: data) {
//                    completion(userResponse)
//                } else {
//                    print("Failed to decode getAllPosts")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    static func updatePost(id: String, body: String, poster: String, completion: @escaping (Post) -> Void) {
//
//    }
    
//    static func deletePost(id: String, poster: String, completion: @escaping (Post) -> Void) {
//        let endpoint = "\(host)/posts/\(id)/"
//        let params: Parameters = [
//            "poster": poster
//        ]
//
//        // encoder: JSONParameterEncoder.default
//        AF.request(endpoint, method: .post, parameters: params).validate().responseData { response in
//            switch response.result {
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                jsonDecoder.dateDecodingStrategy = .iso8601
//                if let userResponse = try? jsonDecoder.decode([Post].self, from: data) {
//                    completion(userResponse)
//                } else {
//                    print("Failed to decode getAllPosts")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    // Extra Credit

//    static func getPostersPosts(poster: String, completion: Any) {
//
//    }
}
