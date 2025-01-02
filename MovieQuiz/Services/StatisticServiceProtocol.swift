//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Artem on 1/1/25.
//

import Foundation

protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    
    func store(correct count: Int, total amount: Int) 
}
