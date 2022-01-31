//
//  VehiclesApi.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 30/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import Foundation
import Alamofire

class VehicleApi
{
    func getVehicle(url: String, completion: @escaping VehicleResponseCompletion)
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
                let vehicle = try jsonDecoder.decode(Vehicle.self, from: data)
                completion(vehicle)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
