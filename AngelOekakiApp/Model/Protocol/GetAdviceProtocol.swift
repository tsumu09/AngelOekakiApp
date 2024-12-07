//
//  GetAdviceProtocol.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/05.
//

import UIKit

protocol GetAdviceProtocol {
    func getAdvice(image: UIImage) async -> String
}
