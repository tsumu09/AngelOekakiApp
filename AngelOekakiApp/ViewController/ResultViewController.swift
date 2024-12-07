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
    let getScore: GetScoreProtocol = ChaGPT()
    let getAdvice: GetAdviceProtocol = ChaGPT()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            let score = await getScore.getScore(image: picturedImage!, theme: .init(id: 1, name: "test", imageName: "test"))
            let advice = await getAdvice.getAdvice(image: picturedImage!)
            
            drawedImageView.image = picturedImage
            resultScoreLabel.text = score
            adviceLabel.text = advice
        }
        
        drawedImageView.image = UIImage()
        resultScoreLabel.text = "..."
        adviceLabel.text = "advice"
    }
}
