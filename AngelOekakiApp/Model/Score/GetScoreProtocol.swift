//
//  GetPointProtocol.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/05.
//

import UIKit

protocol GetScoreProtocol {
    func getScore(image: UIImage, theme: Theme) async -> String
}
