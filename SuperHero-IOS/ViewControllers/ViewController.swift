//
//  ViewController.swift
//  SuperHero-IOS
//
//  Created by Mañanas on 20/5/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var superheroList: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        searchSuperheroesBy(name: "a")
    }
    func searchSuperheroesBy (name: String){
        Task {
            superheroList = await SuperheroProvider.findSuperheroesByName(query: name)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        superheroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuperheroViewCell", for: indexPath) as! SuperheroViewCell
        let superhero = superheroList [indexPath.row]
        cell.render(superhero: superhero)
        return cell
    }
    


}

