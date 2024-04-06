//
//  Network.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 30.03.2024.
//

import Foundation
import UIKit

class Network {
    static let shared = Network()
    var gists: [Gists]?
    var avatarImage: UIImage?
    
    func loadGists(username: String, completion: @escaping (Int) -> Void) {
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
                if !(response?.isEmpty ?? false) {
                    completion(2)
                    self.getOwnerAvatar(gist: response)
                } else {
                    completion(1)
                }
                
            } else {
                completion(0)
            }
        }
        task.resume()
    }
    
    func getOwnerAvatar(gist: [Gists]?) {
        
        let avatarUrl =  URL(string: gist?[0].owner.avatar_url ?? "")
        
        let data = try? Data(contentsOf: avatarUrl!)
        guard let data = data else { return }
        avatarImage = UIImage(data: data)
    }
    
}
