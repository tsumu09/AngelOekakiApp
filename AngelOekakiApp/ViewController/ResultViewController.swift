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
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var picturedImage: UIImage?
    var theme: Theme?
    let getScore: GetScoreProtocol = DummyScore()
    let getAdvice: GetAdviceProtocol = DummyAdvice()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButton.layer.cornerRadius = continueButton.frame.height / 2
        backButton.layer.cornerRadius = backButton.frame.height / 2
        
        Task {
            let score = await getScore.getScore(image: picturedImage!, theme: theme!)
            let advice = await getAdvice.getAdvice(image: picturedImage!)
            
            drawedImageView.image = picturedImage
            resultScoreLabel.text = score
            adviceLabel.text = advice
        }
        
        drawedImageView.image = UIImage()
        resultScoreLabel.text = "採点中..."
        adviceLabel.text = "この間にできる一発をお願いします!!"
    }
}
