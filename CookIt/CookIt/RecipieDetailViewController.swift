//
//  RecipieDetailViewController.swift
//  CookIt
//
//  Created by Muhammad Huzaifa Khalid on 2021-11-09.
//

import UIKit

class RecipieDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var recipie: Recipie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = recipie?.title
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipie?.steps.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stepsCell", for: indexPath)
        cell.textLabel?.text = recipie?.steps[indexPath.row]
        
        stepsLabel.text = recipie?.title
        
        if let theUrl = recipie?.imageURL,
           let url = URL(string: theUrl),
           let data = try?Data(contentsOf: url)
        {
            imageView.image = UIImage(data: data)
            
        }
        return cell
    }
    
    

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


