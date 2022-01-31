//
//  StarshipsApi.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 30/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import Foundation
import Alamofire

class StarshipsApi
{
    func getStarship(url: String, completion: @escaping StarshipsResponseCompletion)
    {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON
        { (response) in
            if let error = response.result.error
            {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do {
                let starship = try jsonDecoder.decode(Starships.self, from: data)
                completion(starship)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
