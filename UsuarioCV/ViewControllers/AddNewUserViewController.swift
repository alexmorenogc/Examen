//
//  AddNewUserViewController.swift
//  UsuarioCV
//
//  Created by Alexander Moreno Guillén on 8/12/19.
//  Copyright © 2019 Alexander Moreno Guillén. All rights reserved.
//

import UIKit
import RealmSwift

class AddNewUserViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var cvTitleTextField: UITextField!
    @IBOutlet weak var cvDescriptionTextField: UITextField!
    
    @IBOutlet weak var rateSlider: UISlider! // examen
    var rating:Int? // examen
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        rating = Int(rateSlider.value) //examen
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // examen
    @IBAction func ratingHasChanged(_ sender: UISlider) {
        rating = Int(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "donePressed" {
            if nameTextField.text != nil ||
                surnameTextField.text != nil ||
                ageTextField.text != nil ||
                idTextField.text != nil ||
                jobTextField.text != nil ||
                cvTitleTextField.text != nil ||
                cvDescriptionTextField.text != nil {
                let name = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let surname = surnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let age = ageTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let job = jobTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let idCard = idTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let cvTitle = cvTitleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let cvDescription = cvDescriptionTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                
                let realm = try! Realm()
                
                try! realm.write {
                    let user = User()
                    let cv = Curriculum()
                    user.id = UUID().uuidString
                    user.name = name!
                    user.surname = surname!
                    user.age = Int(age!)!
                    user.idCard = idCard!
                    user.job = job!
                    user.rate = rating! // examen
                    cv.title = cvTitle!
                    cv.cvDescription = cvDescription!
                    user.cv = cv
                    realm.add(user)
                }
            }
        }
    }
}
