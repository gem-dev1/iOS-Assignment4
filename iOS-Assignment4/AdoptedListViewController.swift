//
//  AdoptedListViewController.swift
//  iOS-Assignment4
//
//  Created by user239796 on 4/18/24.
//

import UIKit

class AdoptedListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
//    var adoptedList = (UIApplication.shared.delegate as? AppDelegate)!.adoptedPupsList
    var adoptedList = [AdoptedPup]()
    var a1 = AdoptedPup(name: "edgar", image: UIImage(named: "emptyImage"), breed: "pug")

    @IBOutlet weak var adoptedListTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        adoptedList.append(a1)

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (appDelegate?.adoptedPupsList.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? AdoptedPupsTableViewCell
        
        cell?.pupBreed.text = adoptedList[indexPath.row].breed
        cell?.pupImg.image = adoptedList[indexPath.row].image
        cell?.pupName.text = adoptedList[indexPath.row].name

        // Configure the cell...

        return cell!
        //
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        adoptedList = (UIApplication.shared.delegate as? AppDelegate)!.adoptedPupsList
        adoptedListTable.reloadData()
        
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
