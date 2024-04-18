//
//  DogBreedsViewController.swift
//  iOS-Assignment4
//
//  Created by user239796 on 4/18/24.
//

import UIKit

class DogBreedsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkingDogBreedsDelegate {
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    var networkingService = NetworkingService.shared
    
    
    @IBOutlet weak var dogBreedTable: UITableView!
    
    
    func didFinishWithListofDogBreeds(list: [String]) {
        appDelegate?.dogBreedList = list
        dogBreedTable.reloadData()
    }
    
    func didFinishWithError() {
        // error fetching list
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.dogBreedsDelegate = self
        
        NetworkingService.shared.getListofDogBreeds();
        
        
//        appDelegate?.dogBreedList.append("test1")
//        appDelegate?.dogBreedList.append("test2")
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (appDelegate?.dogBreedList.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = appDelegate?.dogBreedList[indexPath.row]

        // Configure the cell...

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
