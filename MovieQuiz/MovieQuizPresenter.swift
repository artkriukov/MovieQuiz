//
//  MovieQuizPresenter.swift
//  MovieQuiz
//
//  Created by Artem Kriukov on 02.02.2025.
//

import UIKit

final class MovieQuizPresenter {
    private var currentQuestionIndex = 0
    let questionsAmount: Int = 10
    
    var currentQuestion: QuizQuestion?
    weak var viewController: MovieQuizViewController?
    
    func convert(model: QuizQuestion) -> QuizStepViewModel {
        return QuizStepViewModel(
                image: UIImage(data: model.image) ?? UIImage(),
                question: model.text,
                questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)")
    }
    
    func isLastQuestion() -> Bool {
        currentQuestionIndex == questionsAmount - 1
    }
    
    func resetQuestionIndex() {
        currentQuestionIndex = 0
    }
    
    func switchNextQuestionIndex() {
        currentQuestionIndex += 1
    }
    
    func yesButtonClicked() {
        guard let currentQuestion else { return }
        let givenAnswer = true
        
        viewController?.showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
        
    }
    
    func noButtonClicked() {
        guard let currentQuestion else { return }
        let givenAnswer = false
        
        viewController?.showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
}
