//
//  MostPopularMovies.swift
//  MovieQuiz
//
//  Created by Artem Kriukov on 16.01.2025.
//

import Foundation

struct MostPopularMovies: Codable {
    let errorMessage: String
    let items: [MostPopularMovie]
}

struct MostPopularMovie: Codable {
    let title: String
    let rating: String
    let imageURL: URL
    
    private enum CodingKeys: String, CodingKey {
        case title = "fullTitle"
        case rating = "imDbRating"
        case imageURL = "image"
    }
}



/*
{
    "errorMessage" : "",
    "items" : [
        {
            "crew" : "Dan Trachtenberg (dir.), Amber Midthunder, Dakota Beavers",
            "fullTitle" : "Prey (2022)",
            "id" : "tt11866324",
            "imDbRating" : "7.2",
            "imDbRatingCount" : "93332",
            "image" : "https://m.media-amazon.com/images/M/MV5BMDBlMDYxMDktOTUxMS00MjcxLWE2YjQtNjNhMjNmN2Y3ZDA1XkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_Ratio0.6716_AL_.jpg",
            "rank" : "1",
            "rankUpDown" : "+23",
            "title" : "Prey",
            "year" : "2022"
        }
    ]
}
*/
