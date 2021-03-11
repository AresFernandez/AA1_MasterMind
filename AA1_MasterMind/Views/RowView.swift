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
    
    private let width: CGFloat = 40.0
    private let height: CGFloat = 40.0
    
    var viewModel: ViewModel
    
    var body: some View {
        HStack{
            Button(" ", action: { viewModel.changeColor(row: rowNumber, number: 0) })
                .frame(width: self.width, height: self.height, alignment: .center)
                .background(firstColor)
                .cornerRadius(30)
                .padding(1)
            Button(" ", action: { viewModel.changeColor(row: rowNumber, number: 1) })
                .frame(width: self.width, height: self.height, alignment: .center)
                .background(secondColor)
                .cornerRadius(30)
                .padding(1)
            Button(" ", action: { viewModel.changeColor(row: rowNumber, number: 2) })
                .frame(width: self.width, height: self.height, alignment: .center)
                .background(thirdColor)
                .cornerRadius(30)
                .padding(1)
            Button(" ", action: { viewModel.changeColor(row: rowNumber, number: 3) })
                .frame(width: self.width, height: self.height, alignment: .center)
                .background(fourthColor)
                .cornerRadius(30)
                .padding(1)
            
            VStack{
                HStack{
                    Circle()
                        .fill(firstHintColor)
                        .frame(width: self.width/4, height: self.height/4)
                        .padding(5)
                    Circle()
                        .fill(secondHintColor)
                        .frame(width: self.width/4, height: self.height/4)
                        .padding(5)
                }
                HStack{
                    Circle()
                        .fill(thirdHintColor)
                        .frame(width: self.width/4, height: self.height/4)
                        .padding(5)
                    Circle()
                        .fill(fourthHintColor)
                        .frame(width: self.width/4, height: self.height/4)
                        .padding(5)
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
