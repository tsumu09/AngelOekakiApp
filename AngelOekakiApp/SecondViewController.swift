//
//  SecondViewController.swift
//  AngelOekakiApp
//
//  Created by 高橋紬季 on 2024/12/06.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var paintArray: [Paint] = [
        Paint(name: "ひまわりを描こう", imageName: "himawari.jpg"),
        Paint(name: "モナリザを描こう", imageName: "monariza.jpg"),
        Paint(name: "叫びを描こう", imageName: "sakebi.jpg")
    ]
    var index: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    func setUI() {
        imageView.image = paintArray[index].getImage()
        nameLabel.text = paintArray[index].name
        
        displayRandompaint()
        
    }
    func displayRandompaint() {
        let randomIndex = Int.random(in: 0..<paintArray.count)
        nameLabel.text = paintArray[randomIndex]
    }
}
