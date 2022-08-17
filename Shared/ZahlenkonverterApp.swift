//
//  ZahlenkonverterApp.swift
//  Shared
//
//  Created by Domenic Moran on 17.08.22.
//

import SwiftUI

@main
struct ZahlenkonverterApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            ContentView()
                .frame(minWidth: 500)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            #else
            ContentView()
            #endif
        }
    }
}
