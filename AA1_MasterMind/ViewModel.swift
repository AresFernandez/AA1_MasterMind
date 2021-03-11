//
//  ViewModel.swift
//  AA1_MasterMind
//
//  Created by Alumne on 9/3/21.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var RowList: [row] = [
        row(number: 0, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
        row(number: 1, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
        row(number: 2, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
        row(number: 3, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
        row(number: 4, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
        row(number: 5, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
        row(number: 6, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
        row(number: 7, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
        row(number: 8, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
        row(number: 9, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
        row(number: 10, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
        row(number: 11, color: [.gray,.gray,.gray,.gray], hints: [.gray,.gray,.gray,.gray]),
    ]
    
    public func changeColor(row: Int, number: Int) {
        
        switch self.RowList[row].color[number] {
        case Color.gray:
            self.RowList[row].color[number] = Color.red
        case Color.red:
            self.RowList[row].color[number] = Color.green
        case Color.green:
            self.RowList[row].color[number] = Color.blue
        case Color.blue:
            self.RowList[row].color[number] = Color.yellow
        case Color.yellow:
            self.RowList[row].color[number] = Color.red
        default:
            self.RowList[row].color[number] = Color.gray
        }
    }
    
    var numberOfTries = 0
    @Published var buttonText: String = "Try Guess"
    
    var colorAnswer: [Color] = [Color.blue,Color.blue,Color.blue,Color.blue]
    
    public func tryGuess() {
        
        refreshHints()
        
        if checkWin(colors: RowList[numberOfTries].color) {
            self.buttonText = "You Win"
            numberOfTries = 0
        }
        else {
            if(numberOfTries < 11) {
                self.buttonText = "Try Again"
                numberOfTries+=1
            }
            else{
                self.buttonText = "You Lose"
                numberOfTries = 0
            }
        }

    }
    
    func checkWin(colors: [Color]) -> Bool{
        if colors[0] == colorAnswer[0] && colors[1] == colorAnswer[1] && colors[2] == colorAnswer[2] && colors[3] == colorAnswer[3] {
            return true
        }
        return false
    }
    
    func refreshHints(){
    }
    
}
