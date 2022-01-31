//
//  MoviesApi.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 31/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import Foundation
import Alamofire

class MoviesApi {
    
    func getMovie(url: String, completion: @escaping MoviesResponseCompletion) {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do {
                let movie = try jsonDecoder.decode(Movies.self, from: data)
                completion(movie)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
