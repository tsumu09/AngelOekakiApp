//
//  Theme.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/05.
//

import UIKit

struct Theme : Identifiable {
    let id: Int
    let name: String
    let imageName: String
    
    init(id: Int, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
    
    var uiImage : UIImage {
        UIImage(named: imageName)!
    }
}
