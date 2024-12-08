//
//  ThemeSelectViewController.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/05.
//

import UIKit

class ThemeSelectViewController: UIViewController {
    var theme: Theme? = nil
    var capturedImage: UIImage?
    
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themeImageView: UIImageView!
    @IBOutlet weak var takePhotoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        theme = ThemeData.shared.random()
        themeLabel.text = theme?.name
        themeImageView.image = UIImage(named: theme!.imageName)
        takePhotoButton.layer.cornerRadius = takePhotoButton.frame.height / 2
        themeImageView.layer.cornerRadius = themeImageView.frame.size.height * 0.1
    }
    
    @IBAction func OnTapTakePhotoButton(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            let alert = UIAlertController(title: "Error", message: "Camera is not available", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConfirm" {
            let destinationVC = segue.destination as? ConfirmViewController
            destinationVC?.theme = theme!
            destinationVC?.picturedImage = capturedImage
        }
    }
}

extension ThemeSelectViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        capturedImage = image
        picker.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "toConfirm", sender: self)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      picker.dismiss(animated: true, completion: nil)
  }
}
