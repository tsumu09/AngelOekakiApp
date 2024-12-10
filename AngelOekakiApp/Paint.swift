//
//  Paint.swift
//  AngelOekakiApp
//
//  Created by 高橋紬季 on 2024/12/10.
//

import UIKit

class Paint {
    
    var name: String
    var imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    func getImage() -> UIImage {
        return UIImage(named: imageName)!
    }
}
