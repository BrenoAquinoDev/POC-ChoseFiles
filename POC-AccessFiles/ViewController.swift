//
//  ViewController.swift
//  POC-AccessFiles
//
//  Created by Breno Aquino on 05/03/18.
//  Copyright © 2018 Breno Aquino. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBAction func photoAction(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            myPickerController.mediaTypes = [kUTTypeImage as String]
            self.present(myPickerController, animated: true)
        }
    }
    
    @IBAction func movieAction(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            myPickerController.mediaTypes = [kUTTypeMovie as String]
            self.present(myPickerController, animated: true)
        }
    }
    
    @IBAction func docAction(_ sender: Any) {
        
        
    }
    
    @IBAction func anythingAction(_ sender: Any) {
        
        
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Photo
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
        
            self.imageView.image = image
            
        }
        // Movie
        else if let videoURL = info[UIImagePickerControllerMediaURL]as? NSURL {
            
            let asset = AVURLAsset(url: videoURL as URL)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            
            imgGenerator.appliesPreferredTrackTransform = true
            
            let cgImage = try! imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            
            self.imageView.image = thumbnail
        }
        
        self.dismiss(animated: true)
    }
}

