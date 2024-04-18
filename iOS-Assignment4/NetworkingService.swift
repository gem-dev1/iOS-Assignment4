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
    var dogBreedsDelegate: NetworkingDogBreedsDelegate?
    var dogImagesDelegate: NetworkingDogImagesDelegate?
    
    func getListofDogBreeds() {
        
    }
    
    func getListofDogPictures(dogBreed: String){
        
    }
}
