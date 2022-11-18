//
//  MainView.swift
//  UnitConverter
//
//  Created by A Moses on 12/11/22.
//

import Foundation
import SwiftUI

struct MainView: View
{
    var body: some View
    {
        TabView
        {
            TempView()
            .tabItem
            {
                Label("Temperature", systemImage: "thermometer")
            }
            
            LengthView()
            .tabItem
            {
                Label("Length", systemImage: "ruler")
            }
            VolumeView()
            .tabItem
            {
                Label("Volume", systemImage: "cylinder")
            }
        }
    }
}
