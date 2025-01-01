//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Artem on 1/1/25.
//

import Foundation

struct GameResult: Codable, Comparable {
    let correct: Int
    let total: Int
    let date: Date
    
    private var accuracy: Double {
        guard total != 0 else {
            return 0
        }
        return Double(correct) / Double(total)
    }
    
    func isBetterThan(_ another: GameResult) -> Bool {
        correct > another.correct
    }
    
    static func < (lhs: GameResult, rhs: GameResult) -> Bool {
        return lhs.accuracy < rhs.accuracy
    }
    
}
