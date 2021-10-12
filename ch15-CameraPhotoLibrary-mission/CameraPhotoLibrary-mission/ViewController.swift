//
//  ViewController.swift
//  CameraPhotoLibrary-mission
//
//  Created by dev on 2021/10/12.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imgViewTop: UIImageView!
    @IBOutlet var imgViewBottomLeft: UIImageView!
    @IBOutlet var imgViewBottomRight: UIImageView!
    
    let imagePicker: UIImagePickerController = UIImagePickerController()
    var captureImage: UIImage!
    var numImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnTakePhoto(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    @IBAction func btnLoadPhoto(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [UTType.image.identifier]
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album")
        }
    }
    
    @IBAction func btnRefresh(_ sender: UIButton) {
        imgViewTop.image = nil
        imgViewBottomLeft.image = nil
        imgViewBottomRight.image = nil
        numImage = 0
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        if mediaType.isEqual(to: UTType.image.identifier) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            if numImage == 0 {
                imgViewTop.image = captureImage
            } else if numImage == 1 {
                imgViewBottomLeft.image = captureImage
            } else if numImage == 2 {
                imgViewBottomRight.image = captureImage
            }
            numImage = (numImage + 1) % 3
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

