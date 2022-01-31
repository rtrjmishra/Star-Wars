//
//  MoviesVC.swift
//  Star Wars FC
//
//  Created by Rituraj Mishra on 30/01/22.
//  Copyright © 2022 rtrjmishra. All rights reserved.
//

import UIKit

class MoviesVC: UIViewController
{
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var producer: UILabel!
    @IBOutlet weak var released: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var crawlLbl: UITextView!
    
    var person: Person!
    let api = MoviesApi()
    var movies = [String]()
    var currentMovie = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        movies = person.filmsUrl
        previousBtn.isEnabled = false
        nextBtn.isEnabled = movies.count > 1
        guard let firstMovie = movies.first else { return }
        getMovie(url: firstMovie)
    }
    
    func getMovie(url: String)
    {
        api.getMovie(url: url)
        { (movie) in
            if let movie = movie
            {
                self.setupView(movie: movie)
            }
        }
    }
    
    func setupView(movie: Movies)
    {
        titleLbl.text = movie.title
        episode.text = String(movie.episode)
        director.text = movie.director
        producer.text = movie.producer
        released.text = movie.releaseData
        let stripped = movie.crawl.replacingOccurrences(of: "\n", with: " ")
        crawlLbl.text = stripped.replacingOccurrences(of: "\r", with: "")
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton)
    {
        currentMovie += 1
        setButtonState()
    }
    @IBAction func previousBtnClicked(_ sender: UIButton)
    {
        currentMovie -= 1
        setButtonState()
    }
    
    func setButtonState()
    {
        nextBtn.isEnabled = currentMovie == movies.count - 1 ? false : true
        previousBtn.isEnabled = currentMovie == 0 ? false : true
        getMovie(url: movies[currentMovie])
    }
}
