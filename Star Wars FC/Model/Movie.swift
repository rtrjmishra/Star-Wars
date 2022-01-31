//
//  Movie.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 31/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import Foundation

struct Movies : Codable
{
    let title: String
    let episode: Int
    let crawl: String
    let director: String
    let producer: String
    let releaseData: String
    
    enum CodingKeys: String, CodingKey
    {
        case title
        case episode = "episode_id"
        case director
        case crawl = "opening_crawl"
        case producer
        case releaseData = "release_date"
    }
}
