//
//  NetworkManager.swift
//  AfNetwork
//
//  Created by Sergey on 26.01.2022.
//

import Alamofire

class NetworkManager {
        
    
    func fetchAnimeList(handler: @escaping ([Anime]) -> Void) {
        AF.request(URLAnime.animeList.rawValue).validate().responseDecodable(of: AnimeList.self) { response in
            switch response.result{
            case .success(let value):
                handler(value.data)
            case.failure(let error):
                print(error)
            }
        }
       
    }
}


