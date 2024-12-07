//
//  Dummy.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/05.
//
import UIKit

class Dummy : GetScoreProtocol, GetAdviceProtocol {
    func getScore(image: UIImage, theme: Theme) -> String {
        "40点です"
    }
    
    func getAdvice(point: Float, theme: Theme) -> String {
        "データベースの物理設計と隣接する領域に、データのバックアップおよびリストアの設計があります。データベースは、システムにとって極めて重要なデータが一元管理されており、いわばシステムの心臓です。それゆえ、万が一にでもデータベース内のデータが失われるようなことがあってはなりません。もしそのようなことが起きた場合は、多額の損害を覚悟する必要があります。"
    }
}
