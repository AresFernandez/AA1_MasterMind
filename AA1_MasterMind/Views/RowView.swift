//
//  RowView.swift
//  AA1_MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct RowView: View {
    var firstColor: Color
    var secondColor: Color
    var thirdColor: Color
    var fourthColor: Color
    
    var firstHintColor: Color
    var secondHintColor: Color
    var thirdHintColor: Color
    var fourthHintColor: Color
    
    var rowNumber: Int
    
    var viewModel: ViewModel
    
    var body: some View {
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        let width: CGFloat = (screenHeight - 100) / 12 * 0.75
        let height: CGFloat = (screenHeight - 100) / 12 * 0.75
        
        HStack{
            Text(String(self.rowNumber + 1))
                .padding(1)
            Button("  ", action: { viewModel.changeColor(row: rowNumber, number: 0) })
                .frame(width: width, height: height, alignment: .center)
                .background(firstColor)
                .cornerRadius(30)
                .padding(1)
            Button("  ", action: { viewModel.changeColor(row: rowNumber, number: 1) })
                .frame(width: width, height: height, alignment: .center)
                .background(secondColor)
                .cornerRadius(30)
                .padding(1)
            Button("  ", action: { viewModel.changeColor(row: rowNumber, number: 2) })
                .frame(width: width, height: height, alignment: .center)
                .background(thirdColor)
                .cornerRadius(30)
                .padding(1)
            Button("  ", action: { viewModel.changeColor(row: rowNumber, number: 3) })
                .frame(width: width, height: height, alignment: .center)
                .background(fourthColor)
                .cornerRadius(30)
                .padding(1)
            
            VStack{
                HStack{
                    Circle()
                        .fill(firstHintColor)
                        .frame(width: width/4, height: height/4)
                        .padding(2)
                    Circle()
                        .fill(secondHintColor)
                        .frame(width: width/4, height: height/4)
                        .padding(2)
                }
                HStack{
                    Circle()
                        .fill(thirdHintColor)
                        .frame(width: width/4, height: height/4)
                        .padding(2)
                    Circle()
                        .fill(fourthHintColor)
                        .frame(width: width/4, height: height/4)
                        .padding(2)
                }
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(firstColor: Color.red,
                secondColor: Color.green,
                thirdColor: Color.blue,
                fourthColor: Color.yellow,
                firstHintColor: Color.red,
                secondHintColor: Color.green,
                thirdHintColor: Color.blue,
                fourthHintColor: Color.yellow,
                rowNumber: 0,
                viewModel: ViewModel())
    }
}
