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
    
    @Published var numberOfTries = 0
    @Published var buttonText: String = "Try Guess"
    
    lazy var colorAnswer: [Color] = randomizeAnswer()
    
    public func tryGuess() {
        
        if self.buttonText == "You Win! Play Again?" || self.buttonText == "You Lose! Play Again?" {
            resetGame()
            self.buttonText = "Try Guess"
            return
        }
        
        if(!checkCorrectInput(colors: RowList[numberOfTries].color)){
            self.buttonText = "Invalid Code"
            return
        }
        
        
        refreshHints(colors: RowList[numberOfTries].color)
        
        if checkWin(colors: RowList[numberOfTries].color) {
            self.buttonText = "You Win! Play Again?"
        }
        else {
            if(numberOfTries < 11) {
                self.buttonText = "Try Again"
                numberOfTries+=1
            }
            else{
                self.buttonText = "You Lose! Play Again?"
                numberOfTries = 0
            }
        }

    }
    
    func randomizeAnswer() -> [Color]{
        var newColorAnswer: [Color] = [Color.blue,Color.red,Color.blue,Color.red]
        for i in 0...3 {
            let colorInt : Int = Int.random(in: 0..<4)
            switch colorInt {
            case 0:
                newColorAnswer[i] = Color.red
            case 1:
                newColorAnswer[i] = Color.green
            case 2:
                newColorAnswer[i] = Color.blue
            case 3:
                newColorAnswer[i] = Color.yellow
            default:
                newColorAnswer[i] = Color.red
            }

        }
        print(newColorAnswer)
        return newColorAnswer
    }
    
    func checkCorrectInput(colors: [Color]) -> Bool{
        if colors[0] != Color.gray && colors[1] != Color.gray && colors[2] != Color.gray && colors[3] != Color.gray {
            return true
        }
        return false
    }
    
    func checkWin(colors: [Color]) -> Bool{
        if colors[0] == colorAnswer[0] && colors[1] == colorAnswer[1] && colors[2] == colorAnswer[2] && colors[3] == colorAnswer[3] {
            return true
        }
        return false
    }
    
    func refreshHints(colors: [Color]){
        var colorsInPosition : Int = 0
        var colorsInPositionAux : [Int] = [0,0,0,0]
        for i in 0...3 {
            if colorAnswer[i] == colors[i] {
                colorsInPosition += 1
                colorsInPositionAux[i] = 1
            }
        }

        if colorsInPosition > 0 {
            for i in 0...(colorsInPosition-1) {
                RowList[numberOfTries].hints[i] = Color.red
            }
        }
        
        var colorsSwitched : Int = 0
        var colorsSwitchedAux : [Int] = [0,0,0,0]
        for i in 0...3 {
            for j in 0...3 {
                if colorsInPositionAux[j] == 1  {
                    break;
                }
                if colors[i] == colorAnswer[j] && colorsSwitchedAux[j] == 0 {
                    colorsSwitched += 1
                    colorsSwitchedAux[j] = 1
                }
            }
        }
        
        if colorsSwitched > 0 {
            for i in colorsInPosition...(colorsInPosition + colorsSwitched-1) {
                RowList[numberOfTries].hints[i] = Color.yellow
            }
        }
        
        
        for i in 0...3 {
            if RowList[numberOfTries].hints[i] == Color.gray {
                RowList[numberOfTries].hints[i] = Color.white
            }
        }
    }
    
    func resetGame(){
        numberOfTries = 0
        colorAnswer = randomizeAnswer()
        RowList = [
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
    }
    
}
