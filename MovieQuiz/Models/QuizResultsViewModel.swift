//
//  QuizResultsViewModel.swift
//  MovieQuiz
//
//  Created by Artem on 12/29/24.
//

import Foundation

struct QuizResultsViewModel {
    let title: String
    let text: String
    let buttonText: String
    let completion: (() -> Void)?
}
