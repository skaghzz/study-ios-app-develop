//
//  AddViewController.swift
//  Table
//
//  Created by dev on 2021/10/11.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var imageFiles = ["cart.png", "clock.png", "pencil.png"]
    var selectImageName: String = ""
    
    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var selectImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        //itemsImageFile.append("clock.png")
        itemsImageFile.append(selectImageName)
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFiles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: UIImage(named: imageFiles[row]))
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectImageView.image = UIImage(named: imageFiles[row])
        selectImageName = imageFiles[row]
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
