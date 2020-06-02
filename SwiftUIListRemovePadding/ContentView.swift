//
//  ContentView.swift
//  SwiftUIListRemovePadding
//
//  Created by ProgrammingWithSwift on 2020/05/31.
//  Copyright © 2020 ProgrammingWithSwift. All rights reserved.
//

/*
 References:
 https://developer.apple.com/documentation/swiftui/view/3278589-listrowinsets
 https://developer.apple.com/documentation/swiftui/list/3270239-listrowinsets
 */

import SwiftUI

struct ContentView: View {
    
    enum Flavor: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        case vanilla, chocolate, strawberry
    }
    
    var body: some View {
        VStack {
            // What I would expect to work but doesn't
            Text("First attempt")
            List(Flavor.allCases, id: \.self) { flavour in
                Text(flavour.rawValue)
                    .border(Color.red, width: 1)
            }

            // Solution 1
            Text("Solution ")
            List {
                ForEach(Flavor.allCases, id: \.self) { flavour in
                    Text(flavour.rawValue)
                        .listRowInsets(.init())
                        .border(Color.red, width: 1)
                }
            }

            // Solution 2
            Text("Solution 2")
            GeometryReader { geometry in
                List {
                    ForEach(Flavor.allCases, id: \.self) { flavour in
                        Text(flavour.rawValue)
                            .frame(width: geometry.size.width,
                                   alignment: .leading)
                            .listRowInsets(.init())
                            .border(Color.red, width: 1)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
