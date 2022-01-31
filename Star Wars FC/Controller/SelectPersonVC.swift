//
//  SelectPersonVC.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 29/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.

import UIKit

class SelectPersonVC: UIViewController
{
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var hair: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var vehiclesButton: UIButton!
    @IBOutlet weak var starshipsButton: UIButton!
    @IBOutlet weak var moviesButton: UIButton!
    
    var personApi = PersonApi()
    var person: Person!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func randomButtonClicked(_ sender: UIButton)
    {
        let random = Int.random(in: 1 ... 87)
        spinner.startAnimating()
        personApi.getRandomPersonAlamo(id: random)
        { (person) in
            self.spinner.stopAnimating()
            if let person = person
            {
                self.setUpView(person: person)
                self.person = person
            }
        }
    }
    
    func setUpView(person: Person)
    {
        name.text = person.name
        height.text = person.height
        mass.text = person.mass
        birthYear.text = person.birthYear
        gender.text = person.gender
        hair.text = person.hair
        
        homeButton.isEnabled = !person.homeWorldUrl.isEmpty
        vehiclesButton.isEnabled = !person.vehiclesUrl.isEmpty
        moviesButton.isEnabled = !person.filmsUrl.isEmpty
        starshipsButton.isEnabled = !person.starshipsUrl.isEmpty
        
    }
    
    //MARK: -SEGUES
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toHomeworld"
        {
            if let destination = segue.destination as? HomeWorldVC
            {
                destination.person = person
            }
        }else if segue.identifier == "toVehicles"
        {
            if let destination = segue.destination as? VehiclesVC
            {
                destination.person = person
            }
        }else if segue.identifier == "toStarships"
        {
            if let destination = segue.destination as? StarshipsVC
            {
                destination.person = person
            }
        }else
        {
            if let destination = segue.destination as? MoviesVC
            {
                destination.person = person
            }
        }
    }
    
}

