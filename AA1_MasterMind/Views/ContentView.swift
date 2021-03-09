//
//  ContentView.swift
//  AA1_MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct row{
    let number: Int
    let color: [Color]
}

struct ContentView: View {
    
    var RowList: [row] = [
        row(number: 1, color: [.gray,.gray,.gray,.gray]),
        row(number: 2, color: [.gray,.yellow,.gray,.gray]),
        row(number: 3, color: [.gray,.gray,.gray,.gray]),
        row(number: 4, color: [.gray,.gray,.blue,.gray]),
        row(number: 5, color: [.gray,.gray,.gray,.gray]),
        row(number: 6, color: [.red,.gray,.gray,.gray]),
        row(number: 7, color: [.gray,.gray,.gray,.gray]),
        row(number: 8, color: [.gray,.gray,.gray,.gray]),
        row(number: 9, color: [.gray,.gray,.gray,.gray]),
        row(number: 10, color: [.gray,.gray,.gray,.gray]),
        row(number: 11, color: [.gray,.gray,.gray,.gray]),
        row(number: 12, color: [.gray,.gray,.gray,.gray]),
    ]
    
    var body: some View {
        VStack{
            Text("Mastermind")
                .font(.title)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.orange)
            VStack{
                ForEach(RowList, id: \.number) { row in
                    RowView(firstColor: row.color[0],
                            secondColor: row.color[1],
                            thirdColor: row.color[2],
                            fourthColor: row.color[3])
               }
            }
            Text("Tried 2 times")
                .font(.title)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
