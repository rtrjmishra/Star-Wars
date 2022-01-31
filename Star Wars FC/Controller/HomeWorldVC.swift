//
//  HomeWorldVC.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 30/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import UIKit

class HomeWorldVC: UIViewController
{
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var climate: UILabel!
    @IBOutlet weak var terrain: UILabel!
    @IBOutlet weak var population: UILabel!
    
    
    var person: Person!
    let api = HomeworldApi()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        api.getHomeworld(url: person.homeWorldUrl)
        { (homeworld) in
            if let homeworld = homeworld{
                print("HEYYYY")
                self.setupUI(homeworld: homeworld)
            }else{print(self.person.homeWorldUrl)}
        }
    }
    
    func setupUI(homeworld: Homeworld)
    {
        name.text = homeworld.name
        climate.text = homeworld.climate
        terrain.text = homeworld.terrain
        population.text = homeworld.population
    }
}
