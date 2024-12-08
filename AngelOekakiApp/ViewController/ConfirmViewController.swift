//
//  ConfirmViewController.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/06.
//

import UIKit

class ConfirmViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    var theme: Theme?
    var picturedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = theme?.name
        imageView.image = picturedImage
        startButton.layer.cornerRadius = startButton.frame.height / 2
        imageView.layer.cornerRadius = imageView.frame.size.height * 0.1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let destinationVC = segue.destination as? ResultViewController
            destinationVC?.theme = theme
            destinationVC?.picturedImage = picturedImage
        }
    }
    
    @IBAction func OnTappedResultButton(_ sender: Any) {
        performSegue(withIdentifier: "toResult", sender: nil)
    }
}
