//
//  Starships.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 30/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import Foundation

struct Starships : Codable
{
    
    let name: String
    let model: String
    let starShipClass: String
    let manufacturer: String
    let hyperdrive: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let passengers: String
    
    enum CodingKeys: String, CodingKey
    {
        case name
        case model
        case starShipClass = "starship_class"
        case manufacturer
        case hyperdrive = "hyperdrive_rating"
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
    }
}
