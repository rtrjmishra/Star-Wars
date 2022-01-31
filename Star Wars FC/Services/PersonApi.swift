//
//  PersonApi.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 29/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonApi
{
   func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion)
    {
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        
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
            do{
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
