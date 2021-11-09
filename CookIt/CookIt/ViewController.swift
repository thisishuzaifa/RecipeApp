//
//  ViewController.swift
//  CookIt
//
//  Created by Muhammad Huzaifa Khalid on 2021-11-09.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    
    
    let recipies = [
        Recipie(title: "Best Brownies", steps: ["Brownies Step 1","Brownines Step 2"], imageURL: "https://images.pexels.com/photos/45202/brownie-dessert-cake-sweet-45202.jpeg"),
        Recipie(title: "Banana Bread", steps: ["Banana Bread 1","Banana Bread 2"], imageURL: "https://images.pexels.com/photos/830894/pexels-photo-830894.jpeg"),
        Recipie(title: "Chocolate Chip Cookies", steps: ["Chocolate Chip Cookies 1", "Chocolate Chip Cookies 2"], imageURL: "https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg")
                     ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipies.count}
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipieCell", for: indexPath)
        
        let recipie = recipies[indexPath.row]
            if let url = URL(string: recipie.imageURL),
               let data = try?Data(contentsOf: url){
                cell.imageView?.image = UIImage(data: data)
            }
        cell.textLabel?.text = recipies[indexPath.row].title
        
        return cell}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipieDetailViewController = segue.destination as? RecipieDetailViewController,
           let index = tableView.indexPathForSelectedRow?.row{
            recipieDetailViewController.recipie = recipies[index]}}
}

