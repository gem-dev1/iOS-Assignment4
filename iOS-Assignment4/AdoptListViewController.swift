//
//  AdoptListViewController.swift
//  iOS-Assignment4
//
//  Created by user239796 on 4/17/24.
//

import UIKit

class AdoptListViewController: UIViewController, NetworkingDogImagesDelegate {
    var breedName = ""
    
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameInput: UITextField!
    
    
    func didFinishWithListofDogImages(dogImgUrl: String) {
        print(dogImgUrl)
    }
    
    
    func didFinishWithError() {
        //
    }
    
    @IBAction func onAdoptClick(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkingService.shared.dogImagesDelegate = self
        
        NetworkingService.shared.getListofDogPictures(dogBreed: breedName);
        
        breedLabel.text = breedName

        // Do any additional setup after loading the view.
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
