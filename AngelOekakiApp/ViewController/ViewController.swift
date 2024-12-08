//
//  ViewController.swift
//  AngelOekakiApp
//
//  Created by 高橋紬季 on 2024/12/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = startButton.frame.height / 2
    }
}

