//
//  LengthView.swift
//  UnitConverter
//
//  Created by A Moses on 18/11/22.
//

import Foundation
import SwiftUI

struct LengthView: View
{
    @State private var length = ""
    @State private var inputUnit = UnitLength.meters
    @State private var outputUnit = UnitLength.feet
    
    @FocusState private var inputIsFocused: Bool
    
    let units = [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
    
    var convertedLength: Double
    {
        let lengthDouble = Double(length) ?? 0.0
        
        let initialUnit = Measurement(value: lengthDouble, unit: inputUnit)
        
        return initialUnit.converted(to: outputUnit).value
    }

    var body: some View
    {
        NavigationView
        {
            Form
            {
                Section
                {
                    TextField("Length", text: $length)
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
                                Text($0.symbol)
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
                                Text($0.symbol)
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
                    Text(String(convertedLength))
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

struct LengthView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LengthView()
    }
}

