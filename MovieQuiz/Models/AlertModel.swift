//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Artem on 12/31/24.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: (() -> Void)?
}
