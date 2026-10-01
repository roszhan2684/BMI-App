//
//  ResultView.swift
//  BMI_App
//
//  Created by Susan Dsouza on 2/26/25.
//
import SwiftUI

struct ResultView: View{
    @ObservedObject var viewModel: BMICalculatorViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View{
        ZStack{
            viewModel.getColor().ignoresSafeArea()
            VStack(spacing: 20){
                Text("YOUR RESULT")
                    .font(.title)
                    .fontWeight(.semibold)
                Text(viewModel.getBMIValue())
                    .font(.system(size: 80, weight: .bold))
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                Text(viewModel.getAdvice())
                    .font(.title3)
                    .fontWeight(.medium)
                Button(action:{ dismiss()}){
                    Text("RECALCULATE")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.purple)
                        .cornerRadius(10)
                }
                .padding(.top, 30)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
