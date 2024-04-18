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
    func didFinishWithListofDogImages(dogImgUrl: String);
    func didFinishWithError();
}

class NetworkingService {
    static var shared = NetworkingService()
    
    var dogBreedsDelegate: NetworkingDogBreedsDelegate?
    var dogImagesDelegate: NetworkingDogImagesDelegate?
    
    func getListofDogBreeds() {
        let urlObj = URL(string: "https://dog.ceo/api/breeds/list/all")!
        let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
            
            if let _ = error {
                self.dogBreedsDelegate?.didFinishWithError()
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                self.dogBreedsDelegate?.didFinishWithError()
                return
            }
            
            do {
                if let data = data {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let jsonDict = json as? [String: Any],
                       let dogBreedsDict = jsonDict["message"] as? [String: Any] {
                        // Extract dog breeds from the "dogbreeds" dictionary
                        let dogBreeds = Array(dogBreedsDict.keys)
                        
                        DispatchQueue.main.async {
                            self.dogBreedsDelegate?.didFinishWithListofDogBreeds(list: dogBreeds)
                        }
                    }
                }
            } catch {
                print("Error parsing JSON: \(error)")
                self.dogBreedsDelegate?.didFinishWithError()
            }
            
        }
        
        task.resume()
    }
    
    func getListofDogPictures(dogBreed: String){
        let urlObj = URL(string: "https://dog.ceo/api/breed/\(dogBreed)/images/random")!
        let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
            
            if let _ = error {
                self.dogImagesDelegate?.didFinishWithError()
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                self.dogImagesDelegate?.didFinishWithError()
                return
            }
                        
            do {
                if let data = data {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let jsonDict = json as? [String: Any],
                       let dogImageUrl = jsonDict["message"] as? String {
                        DispatchQueue.main.async {
                            self.dogImagesDelegate?.didFinishWithListofDogImages(dogImgUrl: dogImageUrl)
                        }
                    }
                }
            } catch {
                print("Error parsing JSON: \(error)")
                self.dogBreedsDelegate?.didFinishWithError()
            }
            
        }
        task.resume()
    }
    
}
