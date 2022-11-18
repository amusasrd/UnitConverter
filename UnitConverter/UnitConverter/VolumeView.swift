//
//  ContentView.swift
//  UnitConverter
//
//  Created by A Moses on 12/11/22.
//
import SwiftUI

struct VolumeView: View
{
    @State private var volume = ""
    @State private var inputUnit = UnitVolume.liters
    @State private var outputUnit = UnitVolume.cups
    
    @FocusState private var inputIsFocused: Bool
    
    let units = [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.cups, UnitVolume.pints, UnitVolume.gallons]
    
    var convertedvolume: Double
    {
        let volumeDouble = Double(volume) ?? 0.0
        
        let initialUnit = Measurement(value: volumeDouble, unit: inputUnit)
        
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
                    TextField("Volume", text: $volume)
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
                    Text(String(convertedvolume))
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

struct VolumeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        VolumeView()
    }
}

