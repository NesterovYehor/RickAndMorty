//
//  IconImageVIewModel.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 01.06.2023.
//

import Foundation
import SwiftUI

class IconImageViewModelRM: ObservableObject{
    @Published var image: UIImage? = nil
    @Published var isloading: Bool = false
    private let folderName: String = "Characters_Images"
    private var imageName: String
    
    init(url: URL, characterId: Int) {
        self.imageName = "\(characterId)"
        getImage(url: url, imageName: imageName)
    }
    
    func downloadImage(url: URL, complitionhendler : @escaping (_ image: UIImage?, _ error: Error?) -> ()){
        URLSession.shared.dataTask(with: url) { data, respoinse, error in
            guard let data = data,
                  let image = UIImage(data: data)
            else{return complitionhendler(nil, error)}
            complitionhendler(image, nil)
        }.resume()
    }
    func fetchImage(url: URL){
        downloadImage(url: url) { [weak self] fetchingImage, error in
            if let newImage = fetchingImage{
                self?.image = newImage
                self?.saveImage(image: newImage, imageName: self!.imageName, folderName: self!.folderName)
            }
            else{
                print(error)
            }
        }
    }
    //MARK: CHECK IF IMAGE HAS BEEN DOWNLOADED
    func getImage(url: URL, imageName: String){
        if let savedImage = getImageFromFolder(imageName: imageName, folderName: folderName){
            image = savedImage
        }
        else{
            fetchImage(url: url)
        }
    }
    //MARK: SAVE IMAGE
    func saveImage(image: UIImage, imageName: String, folderName: String){
        createFolderIfNeeded(folderName: folderName)
        guard let data = image.pngData(),
              let url = getURLForImage(imageName: imageName, folderName: folderName)
        else{
            return
        }
        do {
            try data.write(to: url)
        } catch let error {
            print ("Error saving image. ImageName: \(imageName). \(error)")
        }
    }
    //MARK: GET IMAGE FROM THE MEMORY
    private func getImageFromFolder(imageName: String, folderName: String) -> UIImage?{
        guard
            let url = getURLForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path)
        else{
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    //MARK: CREATE FOLDER
    private func createFolderIfNeeded(folderName: String){
        guard let url = getURLForFolder(folderName: folderName) else{return}
        
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }
    //MARK: GET PATH TO FOLDER
    private func getURLForFolder(folderName: String) -> URL?{
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return nil}
        return url.appendingPathComponent(folderName)
    }
    //MARK: GET PATH TO IMAGE
    private func getURLForImage(imageName: String, folderName: String) -> URL?{
        guard let folderURL = getURLForFolder(folderName: folderName) else{
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
