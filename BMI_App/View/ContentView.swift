//
//  ContentView.swift
//  BMI_App
//
//  Created by Susan Dsouza on 2/26/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BMICalculatorViewModel()
    var body: some View {
     
        NavigationStack{
            VStack(spacing: 30){
                Text("CALCULATE\n YOUR BMI").font(.largeTitle).fontWeight(.bold)
                    .multilineTextAlignment(.center)
                VStack(spacing: 20){
                    VStack(alignment: .leading){
                        Text("Height: \(String(format: "%.2f",viewModel.height)) m")
                        Slider(value: $viewModel.height, in: 1.0...2.5, step: 0.001)
                    }
                    VStack(alignment: .leading){
                        Text("Weight: \(Int(viewModel.weight))kg")
                        Slider(value: $viewModel.weight, in: 30...150, step: 1)
                    }
                }
                .padding()
                Button(action: {
                    viewModel.calculateBMI()
                }){
                    Text("CALCULATE")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
            .navigationDestination(isPresented: $viewModel.showResult){
                ResultView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
