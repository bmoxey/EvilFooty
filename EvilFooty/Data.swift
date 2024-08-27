//
//  Data.swift
//  EvilFooty
//
//  Created by Brett Moxey on 26/8/2024.
//
import Foundation
struct Result {
    var year: Int
    var winner: String
}

var results: [Result] = [
    Result(year: 2024, winner: "Charles"),
    Result(year: 2023, winner: "Charles"),
    Result(year: 2022, winner: "Di"),
    Result(year: 2021, winner: "Brett"),
    Result(year: 2020, winner: "Charles"),
    Result(year: 2019, winner: "Brett"),
    Result(year: 2018, winner: "Brett"),
    Result(year: 2017, winner: "Pete"),
    Result(year: 2016, winner: "Brett"),
    Result(year: 2015, winner: "Brett"),
    Result(year: 2014, winner: "Charles"),
    Result(year: 2013, winner: "Di"),
    Result(year: 2012, winner: "Brett"),
    Result(year: 2011, winner: "Charles"),
    Result(year: 2010, winner: "Pete"),
    Result(year: 2009, winner: "Pete"),
    Result(year: 2008, winner: "Di"),
    Result(year: 2007, winner: "Brett"),
    Result(year: 2006, winner: "Pete"),
    Result(year: 2005, winner: "Charles"),
]

var winsPerPerson: [String: Int] {
    var winCounts = [String: Int]()
    
    for result in results {
        winCounts[result.winner, default: 0] += 1
    }
    
    return winCounts
}
