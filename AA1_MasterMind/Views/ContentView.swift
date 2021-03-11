//
//  ContentView.swift
//  AA1_MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack{
            Text("Mastermind")
                .font(.title)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.orange)
            VStack{
                ForEach(self.viewModel.RowList, id: \.number) { row in
                    RowView(firstColor: row.color[0],
                            secondColor: row.color[1],
                            thirdColor: row.color[2],
                            fourthColor: row.color[3],
                            firstHintColor: row.hints[0],
                            secondHintColor: row.hints[1],
                            thirdHintColor: row.hints[2],
                            fourthHintColor: row.hints[3],
                            rowNumber: row.number,
                            viewModel: self.viewModel)
               }
            }
            Button(viewModel.buttonText, action: { self.viewModel.tryGuess() })
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
