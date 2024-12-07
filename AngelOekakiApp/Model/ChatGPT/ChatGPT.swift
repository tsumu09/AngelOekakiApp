//
//  GetChatGPTAdvice.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/07.
//

import UIKit

class ChaGPT : GetAdviceProtocol, GetScoreProtocol {
    private let openAIClient = OpenAIClient()
    
    func getAdvice(image: UIImage) async -> String {
        guard let imageData = decodeImage(inputImage: image) else {
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
    
    func getScore(image: UIImage, theme: Theme) async -> String {
        guard let imageData = decodeImage(inputImage: image) else {
            return "画像変換に失敗しました"
        }
        
        let prompt = """
            ## プロンプト
            この写真に書かれている絵が、どのくらいお題と似ているかで点数をつけてください。
            - 100点満点で、最低点が0点で採点してください。
            - 出力は点数のみで出してください。
            - お題は\(theme.name)です。

            ## 例
            34点です
            78点です
            23点です
        """
        

        
        do {
            let result = try await openAIClient.sendMessage(
                text: prompt,
                image: .data(imageData)
            )
            
            return result
        } catch {
            print("エラーが発生しました: \(error.localizedDescription)")
        }
        
        return "エラーが発生しました。"
    }
    
    private func decodeImage(inputImage: UIImage?) -> Data? {
        guard let image = inputImage,
              let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("画像の読み込みに失敗しました。")
            return nil
        }
        
        return imageData
    }
}
