//
//  GetScore.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/08.
//


import UIKit

class GetScore : GetScoreProtocol {
    private let openAIClient = OpenAIClient()
    
    func getScore(image: UIImage, theme: Theme) async -> String {
        let converter = ImageConverter()
        
        guard let imageData = converter.decodeImage(inputImage: image) else {
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
}
