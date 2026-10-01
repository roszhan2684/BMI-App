//
//  Untitled.swift
//  BMI_App
//
//  Created by Susan Dsouza on 2/26/25.
//

import SwiftUI

class BMICalculatorViewModel: ObservableObject{
    @Published var height: Float = 1.5
    @Published var weight: Float = 60.0
    @Published var bmi: BMI?
    @Published var showResult = false
    
    func calculateBMI(){
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice:"Go, get some M&M",color: Color.yellow.opacity(0.85))
            
        }
        else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "You are in great shape", color: Color.green.opacity(0.63))
        } else{
            bmi = BMI(value: bmiValue, advice: "Time to hit the gym", color:  Color.pink.opacity(0.63))
        }
        showResult = true
    }
    func getBMIValue() -> String {
        String(format: "%.1f", bmi?.value ?? 0.0)
    }
    func getAdvice() -> String{
        bmi?.advice ?? "You are all good"
    }
    
    func getColor() -> Color {
        bmi?.color ?? Color.white
    }
}
