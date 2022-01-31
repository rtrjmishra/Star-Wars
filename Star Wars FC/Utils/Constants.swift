//
//  Constants.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 29/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import Foundation
import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.dev/api/"

let PERSON_URL = URL_BASE+"people/"

typealias PersonResponseCompletion = (Person?)->Void
typealias HomeworldResponseCompletion = (Homeworld?)->Void
typealias VehicleResponseCompletion = (Vehicle?)->Void
typealias StarshipsResponseCompletion = (Starships?)->Void
typealias MoviesResponseCompletion = (Movies?)->Void
