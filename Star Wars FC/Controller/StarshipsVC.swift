//
//  StarshipsVC.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 30/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController
{

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var classLbl: UILabel!
    @IBOutlet weak var maker: UILabel!
    @IBOutlet weak var hyperdrive: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var passengers: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    let api = StarshipsApi()
    var starships = [String]()
    var currentStarship = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        starships = person.starshipsUrl
        nextBtn.isEnabled = starships.count > 1
        previousBtn.isEnabled = false
        guard let firstStarship = starships.first else { return }
        getStarship(url: firstStarship)
    }
    func getStarship(url: String)
    {
        api.getStarship(url: url)
        { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    
    func setupView(starship: Starships)
    {
        name.text = starship.name
        model.text = starship.model
        maker.text = starship.manufacturer
        cost.text = starship.cost
        length.text = starship.length
        speed.text = starship.speed
        crew.text = starship.crew
        passengers.text = starship.passengers
        hyperdrive.text = starship.hyperdrive
        classLbl.text = starship.starShipClass
    }
    
    @IBAction func previousButtonClicked(_ sender: UIButton)
    {
        currentStarship -= 1
        setButtonState()
    }
    
    @IBAction func nextButtonClicked(_ sender: Any)
    {
        currentStarship += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentStarship == starships.count - 1 ? false : true
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        getStarship(url: starships[currentStarship])
    }
    
}
