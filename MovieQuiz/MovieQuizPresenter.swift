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
    var correctAnswers = 0
    
    var currentQuestion: QuizQuestion?
    weak var viewController: MovieQuizViewController?
    let statisticService: StatisticService = StatisticServiceImpl()
    var questionFactory: QuestionFactoryProtocol?
    
    func convert(model: QuizQuestion) -> QuizStepViewModel {
        return QuizStepViewModel(
            image: UIImage(data: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)")
    }
    
    func isLastQuestion() -> Bool {
        currentQuestionIndex == questionsAmount - 1
    }
    
    func restartGame() {
        currentQuestionIndex = 0
    }
    
    func switchNextQuestionIndex() {
        currentQuestionIndex += 1
    }
    
    func yesButtonClicked() {
        didAnswer(isYes: true)
    }
    
    func noButtonClicked() {
        didAnswer(isYes: false)
    }
    
    func didReceiveNextQuestion(question: QuizQuestion?) {
        guard let question else { return }
        
        currentQuestion = question
        let viewModel = convert(model: question)
        
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.show(quiz: viewModel)
        }
    }
    
    func showNextQuestionOrResults() {
        if isLastQuestion() {
            statisticService.store(correct: correctAnswers, total: self.questionsAmount)
            
            let gamesPlayed = statisticService.gamesCount
            let bestRecord = statisticService.bestGame
            let totalAccuracy = statisticService.totalAccuracy
            
            let bestGameDateString = bestRecord?.date.dateTimeString
            
            let bestCorrect = bestRecord?.correct ?? 0
            let bestTotal = bestRecord?.total ?? 0
            let bestDate = bestGameDateString ?? "неизвестно"
            
            let text = """
                        Ваш результат: \(correctAnswers)/\(questionsAmount)
                        Количество сыгранных квизов: \(gamesPlayed)
                        Рекорд: \(bestCorrect)/\(bestTotal) (\(bestDate))
                        Средняя точность: \(String(format: "%.2f", totalAccuracy))%
                        """
            
            let viewModel = QuizResultsViewModel(
                title: "Этот раунд окончен!",
                text: text,
                buttonText: "Сыграть ещё раз")
            viewController?.show(quiz: viewModel)
        }
        else {
            self.switchNextQuestionIndex()
            questionFactory?.requestNextQuestion()
        }
    }
    
    private func didAnswer(isYes: Bool) {
        guard let currentQuestion else { return }
        let givenAnswer = isYes
        
        viewController?.showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
}
