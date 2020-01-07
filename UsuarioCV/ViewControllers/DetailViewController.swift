//
//  DetailViewController.swift
//  UsuarioCV
//
//  Created by Alexander Moreno Guillén on 8/12/19.
//  Copyright © 2019 Alexander Moreno Guillén. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var user: User?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var cvTitleLabel: UILabel!
    @IBOutlet weak var cvDescriptionLabel: UILabel!
    
    @IBOutlet weak var rateLabel: UILabel! // examen
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var star6: UIImageView!
    @IBOutlet weak var star7: UIImageView!
    @IBOutlet weak var star8: UIImageView!
    @IBOutlet weak var star9: UIImageView!
    @IBOutlet weak var star10: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fillView()
    }
    
    func disableStars(_ rate: Int) {
        switch rate {
        case 1:
            star2.alpha = 0
            star3.alpha = 0
            star4.alpha = 0
            star5.alpha = 0
            star6.alpha = 0
            star7.alpha = 0
            star8.alpha = 0
            star9.alpha = 0
            star10.alpha = 0
        case 2:
            star3.alpha = 0
            star4.alpha = 0
            star5.alpha = 0
            star6.alpha = 0
            star7.alpha = 0
            star8.alpha = 0
            star9.alpha = 0
            star10.alpha = 0
        case 3:
            star4.alpha = 0
            star5.alpha = 0
            star6.alpha = 0
            star7.alpha = 0
            star8.alpha = 0
            star9.alpha = 0
            star10.alpha = 0
        case 4:
            star5.alpha = 0
            star6.alpha = 0
            star7.alpha = 0
            star8.alpha = 0
            star9.alpha = 0
            star10.alpha = 0
        case 5:
            star6.alpha = 0
            star7.alpha = 0
            star8.alpha = 0
            star9.alpha = 0
            star10.alpha = 0
        case 6:
            star7.alpha = 0
            star8.alpha = 0
            star9.alpha = 0
            star10.alpha = 0
        case 7:
            star8.alpha = 0
            star9.alpha = 0
            star10.alpha = 0
        case 8:
            star9.alpha = 0
            star10.alpha = 0
        case 9:
            star10.alpha = 0
        case 10: break
        default:
            star1.alpha = 0
            star2.alpha = 0
            star3.alpha = 0
            star4.alpha = 0
            star5.alpha = 0
            star6.alpha = 0
            star7.alpha = 0
            star8.alpha = 0
            star9.alpha = 0
            star10.alpha = 0
        }
    }
    
    func fillView() {
        nameLabel.text = "Name: " + user!.name
        surnameLabel.text = "Surname: " + user!.surname
        ageLabel.text = "Age: \(user!.age)"
        jobLabel.text = "Job: " + user!.job
        idLabel.text = "ID: \(user!.idCard)"
        cvTitleLabel.text = "\(user!.cv!.title)"
        cvDescriptionLabel.text = "\(user!.cv!.cvDescription)"
        rateLabel.text = "Rating: \(user!.rate)" // examen
        disableStars(user!.rate) // examen
    }
    
}
