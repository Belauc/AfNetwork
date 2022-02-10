//
//  Models.swift
//  AfNetwork
//
//  Created by Sergey on 26.01.2022.
//

import Foundation

struct Anime: Codable {
    var anime_id: Int = 0
    var anime_name: String = ""
    var anime_img: String = ""
    
}

struct AnimeFact: Codable {
    let fact_id: Int
    let fact: String
}

struct AnimeList: Codable {
    let data: [Anime]
    
    func fetchData() {
        
    }
}

struct ChooseAnimeFacts: Codable {
    let total_facts: Int
    let img: String
    let data: [AnimeFact]
}
