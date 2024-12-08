//
//  DummyScore.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/08.
//

import UIKit

class DummyScore : GetScoreProtocol {
    func getScore(image: UIImage, theme: Theme) async -> String {
        "40点です"
    }
}
