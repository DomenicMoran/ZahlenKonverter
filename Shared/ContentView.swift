//
//  ContentView.swift
//  Shared
//
//  Created by Domenic Moran on 17.08.22.
//

import SwiftUI

struct ContentView: View {
    @State private var numInput = ""
    @State private var inputBase = 10
    
    let inputSystems = [2: "Binärsystem", 8: "Oktalsystem", 10: "Dezimalsystem", 16: "Hexadezimalsystem"]
    
    var body: some View {
        VStack {
            Menu {
                ForEach(inputSystems.sorted(by: <), id: \.key) { base, name in
                    Button {
                        inputBase = base
                    } label: {
                        Text(name)
                    }
                }

            } label: {
                Text("Eingaben im \(inputSystems[inputBase] ?? "")")
                #if os(iOS)
                Image(systemName: "chevron.down")
                #endif
            }

            
            TextField("Dein Input", text: $numInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            ZStack {
                Color("CardBackgroundColor")
                VStack(spacing: 10) {
                    NumberLine(number: numberSytemResult(forBase: 2), base: "2")
                    NumberLine(number: numberSytemResult(forBase: 8), base: "8")
                    NumberLine(number: numberSytemResult(forBase: 10), base: "10")
                    NumberLine(number: numberSytemResult(forBase: 16), base: "16")
                }
                .padding()
            }
            .cornerRadius(10)
            .shadow(radius: 4)
            .frame(height: 200)
            .padding(.top, 5)
        }
        .padding()
    }
    
    func numberSytemResult(forBase base: Int) -> String {
        if let decimal = UInt64(numInput, radix: inputBase) {
            return String(decimal, radix: base).uppercased()
        }
        return "-"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NumberLine: View {
    let number: String
    let base: String
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0.0) {
            Spacer()
            Text(number)
                .font(.title)
                .minimumScaleFactor(0.8)
            Text(base)
                .minimumScaleFactor(0.2)
        }
        .foregroundColor(.white)
        .lineLimit(1)
    }
}
