//
//  GistsDetailNetwork.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 31.03.2024.
//

import Foundation


class GistDetailNetwork {
    
    static let shared = GistDetailNetwork()
    var gistDetail: GistDetailModel?
    
    
    func getGistDetailInformation(gistUrl : String?, completion: @escaping (Bool) -> Void) {
        let url = URL(string: gistUrl ?? "")
        let task = URLSession.shared.dataTask(with: url!) { data, _, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            guard let data = data else { return }
            let response = try? JSONDecoder().decode(GistDetailModel.self, from: data)
            self.gistDetail = response
            response != nil ? completion(true) : completion(false)
        
        }
        task.resume()
    }
    //print(gistDetail)
}
