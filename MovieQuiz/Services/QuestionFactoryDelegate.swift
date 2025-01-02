//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Artem on 12/31/24.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
