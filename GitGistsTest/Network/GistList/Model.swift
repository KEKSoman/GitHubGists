//
//  Model.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 30.03.2024.
//

import Foundation

struct Gists: Codable {
    
    let url : String
    let created_at : String
    let updated_at : String
    let owner : Owner
    let description : String
    
    enum CodingKeys: String, CodingKey {
        case url
        case created_at
        case updated_at
        case owner
        case description
    }
}

struct Owner: Codable {
    let login : String
    let avatar_url : String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatar_url
    }
}

