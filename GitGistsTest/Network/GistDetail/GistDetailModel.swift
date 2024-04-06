//
//  GistDetailModel.swift
//  GitGistsTest
//
//  Created by Евгений колесников on 31.03.2024.
//

import Foundation


struct GistDetailModel: Codable {
    
    let files : GistFile
    let url : String
    
    enum CodingKeys: String, CodingKey {
        case files
        case url
    }
}

struct GistFile: Codable {
    let gistfile1 : Content
    
    enum CodingKeys: String, CodingKey {
        case gistfile1 = "gistfile1.txt"
    }
}

struct Content: Codable {
    let content : String
    
    enum CodingKeys: String, CodingKey {
        case content
    }
}
