//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Избавиться от кнопки возврата назад на экране результатов +
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
   // 4. Отобразить результаты в соответствии с этим животным
    
    // использовать функции высшего порядка map и sorted
    // отдельный метод для поиска результата
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitationLabel: UILabel!
    
    
    
    var answers: [Answer]!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        calculateResult()
        
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    func calculateResult() {
        var frequentOccurrenceAnswers: [Animal : Int] = [:]
        let answerTypes = answers.map { $0.animal }
        
        
        for answer in answerTypes {
            frequentOccurrenceAnswers[answer] = (frequentOccurrenceAnswers[answer] ?? 0) + 1
        }
        
        let answersSorted = frequentOccurrenceAnswers.sorted( by: { (pair1, pair2 ) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostPopularityAnswers = answersSorted.first!.key
        
        resultAnswerLabel.text = "Вы - \(mostPopularityAnswers.rawValue)"
        resultDefinitationLabel.text = mostPopularityAnswers.definition
    }
}
