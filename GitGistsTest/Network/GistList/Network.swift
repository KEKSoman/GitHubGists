//
//  Network.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 30.03.2024.
//

import Foundation
class Network {
    static let shared = Network()
    var gists: [Gists]?
    
    func loadGists(username: String, completion: @escaping (Bool) -> Void) {
        let basedUrl = "https://api.github.com/users/"
        let url = URL(string: basedUrl + username.lowercased() + "/gists")
        let task = URLSession.shared.dataTask(with: url!) { data, _, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            guard let data = data else { return }
            
            let response = try? JSONDecoder().decode([Gists].self, from: data)
            self.gists = response
            if response != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
        task.resume()
    }
    
    
    
    
}
