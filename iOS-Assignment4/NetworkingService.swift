//
//  NetworkingService.swift
//  iOS-Assignment4
//
//  Created by user239796 on 4/17/24.
//

import Foundation

protocol NetworkingDogBreedsDelegate {
    func didFinishWithListofDogBreeds(list: [String]);
    func didFinishWithError();
}
protocol NetworkingDogImagesDelegate {
    func didFinishWithListofDogImages(imgObj: ImagesModel);
    func didFinishWithError();
}

class NetworkingService {
    static var shared = NetworkingService()
    
    var dogBreedsDelegate: NetworkingDogBreedsDelegate?
    var dogImagesDelegate: NetworkingDogImagesDelegate?
    
    func getListofDogBreeds() {
        let urlObj = URL(string: "https://dog.ceo/api/breeds/list/all")!
        let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
            
            if let error = error {
                self.dogBreedsDelegate?.didFinishWithError()
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                self.dogBreedsDelegate?.didFinishWithError()
                return
            }
            
            if let jsonString = String(data: data!, encoding: .utf8) {
            
                DispatchQueue.main.async {
                    
                }
            }
            
        }
        
        task.resume()
        
    }
    
    func getListofDogPictures(dogBreed: String){
        let urlObj = URL(string: "https://dog.ceo/api/breed/"+dogBreed+"/images")
    }
}
