//
//  MovieQuizPresenterTests.swift
//  MovieQuizPresenterTests
//
//  Created by Artem Kriukov on 03.02.2025.
//

import XCTest
@testable import MovieQuiz



final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    func setButtonsEnabled(_ isEnabled: Bool) {
        
    }
    
    func show(quiz step: QuizStepViewModel) {
        
    }
    
    func show(quiz result: QuizResultsViewModel) {
        
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        
    }
    
    func showLoadingIndicator() {
        
    }
    
    func hideLoadingIndicator() {
        
    }
    
    func showNetworkError(message: String) {
        
    }
}

final class MovieQuizPresenterTests: XCTestCase {
    func testPresenterConvertModel() throws {
        let viewController = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewController)
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}


