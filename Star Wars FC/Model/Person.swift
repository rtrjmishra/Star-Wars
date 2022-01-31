//
//  Person.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 30/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import Foundation
struct Person : Codable
{
    let name: String
    let height: String
    let mass: String
    let hair: String
    let gender: String
    let birthYear: String
    let homeWorldUrl: String
    let filmsUrl: [String]
    let vehiclesUrl: [String]
    let starshipsUrl: [String]
    
    enum CodingKeys: String, CodingKey
    {
        case name
        case height
        case mass
        case hair = "hair_color"
        case gender
        case birthYear = "birth_year"
        case homeWorldUrl = "homeworld"
        case filmsUrl = "films"
        case vehiclesUrl = "vehicles"
        case starshipsUrl = "starships"
    }
}
