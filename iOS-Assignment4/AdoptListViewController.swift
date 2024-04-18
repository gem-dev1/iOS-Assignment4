//
//  AdoptListViewController.swift
//  iOS-Assignment4
//
//  Created by user239796 on 4/17/24.
//

import UIKit

class AdoptListViewController: UIViewController, NetworkingDogImagesDelegate {
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    var breedName = ""
    
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameInput: UITextField!
    
    var pupImg = UIImage(named: "placeholder_profile");
    
    
    func didFinishWithListofDogImages(dogImgUrl: String) {
        print(dogImgUrl)
        downloadImage(imgURL: dogImgUrl)
        
    }
    
    func downloadImage(imgURL: String) {
        var myQ = DispatchQueue(label: "myQ")
        myQ.async {
            do {
                let urlObj = URL(string: imgURL)
                if let goodURL = urlObj {
                    
                    var imageData = try Data(contentsOf: goodURL)
                    DispatchQueue.main.async {
                        self.imgView.image = UIImage(data: imageData)
                    }
                }
            }catch{}
        }
    }
    
    func didFinishWithError() {
        //
    }
    
    @IBAction func onAdoptClick(_ sender: Any) {
        let image = imgView.image as? UIImage
        
        if textFieldNotEmpty(textField: nameInput){
            let pupname = nameInput.text!
            if let goodimage = image {
                let adoptedPup = AdoptedPup(name: pupname, image: goodimage, breed: breedName)
                appDelegate?.adoptedPupsList.append(adoptedPup)
                
                let alert = UIAlertController(title: "Adopted!", message: "", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "Yay!", style: .cancel))
                
                let dismissAction = UIAlertAction(title: "Yay", style: .default) { _ in
                    // Dismissal logic
                    
                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(dismissAction)
                present(alert, animated: true)
                
            }
        } else {
            let alert = UIAlertController(title: "Please give them a name first", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        }
    }
    
    func textFieldNotEmpty(textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false // If the text field's text is nil, consider it empty
        }
        return !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkingService.shared.dogImagesDelegate = self
        
        NetworkingService.shared.getListofDogPictures(dogBreed: breedName);
        
        breedLabel.text = breedName

        // Do any additional setup after loading the view.
    }
    

    @objc func backButtonTapped() {
        // Dismiss the current view controller to go back to the previous one
        dismiss(animated: true, completion: nil)
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
