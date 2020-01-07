//
//  ViewController.swift
//  UsuarioCV
//
//  Created by Alexander Moreno Guillén on 8/12/19.
//  Copyright © 2019 Alexander Moreno Guillén. All rights reserved.
//

import UIKit
import RealmSwift

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let model: MasterModel = MasterModel()
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getUsersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.getNameAndSurname(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            model.deleteUser(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passToDetail" {
            let detailViewController = segue.destination as! DetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                detailViewController.user = model.getUser(indexPath.row)
            }
        }
    }
    
    @IBAction func cancelPressed(segue: UIStoryboardSegue) {
        if segue.identifier == "cancelPressed" {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func donePressed(segue: UIStoryboardSegue) {
        if segue.identifier == "donePressed" {
            tableView.reloadData()
        }
    }
    
}

