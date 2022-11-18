//
//  TempView.swift
//  UnitConverter
//
//  Created by A Moses on 12/11/22.
//

import Foundation
import SwiftUI

struct TempView: View
{
    func cToF(_ degrees: Double) -> Double
    {
        return degrees * 9 / 5 + 32
    }
    
    func fToC(_ degrees: Double) -> Double
    {
        return (degrees - 32) / 9 * 5
    }
    
    @State private var degrees = ""
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Fahrenheit"
    
    @FocusState private var inputIsFocused: Bool
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedDegrees: Double
    {
        let degreesDouble = Double(degrees) ?? 0.0
        
        if inputUnit == "Celsius"
        {
            if outputUnit == "Celsius"
            {
                return degreesDouble
            }
            else if outputUnit == "Fahrenheit"
            {
                return cToF(degreesDouble)
            }
            else
            {
                return degreesDouble + 273.15
            }
        }
        else if inputUnit == "Fahrenheit"
        {
            if outputUnit == "Celsius"
            {
                return fToC(degreesDouble)
            }
            else if outputUnit == "Fahrenheit"
            {
                return degreesDouble
            }
            else
            {
                return fToC(degreesDouble) + 273.15
            }
        }
        else
        {
            if outputUnit == "Celsius"
            {
                return degreesDouble - 273.15
            }
            else if outputUnit == "Fahrenheit"
            {
                return cToF(degreesDouble - 273.15)
            }
            else
            {
                return degreesDouble
            }
        }
    }

    var body: some View
    {
        NavigationView
        {
            Form
            {
                Section
                {
                    TextField("Degrees", text: $degrees)
                            .keyboardType(.decimalPad)
                            .focused($inputIsFocused)
                }
                
                Section
                {
                    Section
                    {
                        Picker("Input Unit", selection: $inputUnit)
                        {
                            ForEach(units, id: \.self)
                            {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    header:
                    {
                        Text("Input Unit")
                    }
                    
                    Section
                    {
                        Picker("Output Unit", selection: $outputUnit)
                        {
                            ForEach(units, id: \.self)
                            {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    header:
                    {
                        Text("Output Unit")
                    }
                }
                header:
                {
                    Text("What unit types do you want to convert between?")
                }


                Section
                {
                    Text(String(convertedDegrees))
                }
                header:
                {
                    Text("Result")
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar
            {
                ToolbarItemGroup(placement: .keyboard)
                {
                    Spacer()
                    
                    Button("Done")
                    {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct TempView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TempView()
    }
}


