//
//  VehiclesVC.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 30/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController
{
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var manufacture: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var passengers: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    let api = VehicleApi()
    var vehicles = [String]()
    var currentVehicle = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        vehicles = person.vehiclesUrl
        nextBtn.isEnabled = vehicles.count > 1
        previousBtn.isEnabled = false
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }
    
    func getVehicle(url: String)
    {
        api.getVehicle(url: url)
        { (vehicle) in
            if let vehicle = vehicle {
                self.setupView(vehicle: vehicle)
            }
        }
    }
    
    func setupView(vehicle: Vehicle)
    {
        name.text = vehicle.name
        model.text = vehicle.model
        manufacture.text = vehicle.manufacturer
        cost.text = vehicle.cost
        length.text = vehicle.length
        speed.text = vehicle.speed
        crew.text = vehicle.crew
        passengers.text = vehicle.passengers
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton)
    {
        currentVehicle += 1
        setButtonState()
    }
    
    @IBAction func previousButtonClicked(_ sender: UIButton)
    {
        currentVehicle -= 1
        setButtonState()
    }
    
    func setButtonState()
    {
        
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        previousBtn.isEnabled = currentVehicle == 0 ? false : true
        
        getVehicle(url: vehicles[currentVehicle])
    }
}
