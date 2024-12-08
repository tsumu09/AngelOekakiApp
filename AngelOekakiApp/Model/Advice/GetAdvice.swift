//
//  GetAdvice.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/08.
//

import UIKit

class GetAdvice : GetAdviceProtocol {
    private let openAIClient: OpenAIClient = OpenAIClient()
    
    func getAdvice(image: UIImage) async -> String {
        let imageConverter = ImageConverter()
        
        guard let imageData = imageConverter.decodeImage(inputImage: image) else {
            return "画像変換に失敗しました"
        }
        
        let prompt = "満点になるために、60文字以内に絵を描くアドバイスを教えてください"
        
        do {
            let result = try await openAIClient.sendMessage(
                text: prompt,
                image: .data(imageData)
            )

            return result
        } catch {
            print("エラーが発生しました: \(error.localizedDescription)")
        }
        
        return "エラーが発生しました"
    }
}
