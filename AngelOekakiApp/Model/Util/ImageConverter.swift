//
//  ConvertImage.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/08.
//

import UIKit

class ImageConverter{
    func decodeImage(inputImage: UIImage?) -> Data? {
        guard let image = inputImage,
              let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("画像の読み込みに失敗しました。")
            return nil
        }
        
        return imageData
    }
}
