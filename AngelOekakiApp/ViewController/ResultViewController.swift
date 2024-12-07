//
//  ResultViewController.swift
//  AngelOekakiApp
//
//  Created by 浦山秀斗 on 2024/12/05.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var drawedImageView: UIImageView!
    @IBOutlet weak var resultScoreLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    var picturedImage: UIImage?
    let getScore: GetScoreProtocol = Dummy()
    let getAdvice: GetAdviceProtocol = Dummy()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let score = getScore.getScore(image: picturedImage!, theme: .init(id: 1, name: "test", imageName: "test"))
        let advice = getAdvice.getAdvice(point: 0.5, theme: .init(id: 1, name: "test", imageName: "test"))

        drawedImageView.image = picturedImage
        resultScoreLabel.text = score
        adviceLabel.text = advice
    }
    

}
