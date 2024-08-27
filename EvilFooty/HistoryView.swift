//
//  HistoryView.swift
//  EvilFooty
//
//  Created by Brett Moxey on 26/8/2024.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack {
            Text("Yearly Winners")
                .font(.title2)
            List(results, id: \.year) { result in
                HStack {
                    Text(result.year.description)
                        .font(.subheadline)
                    Spacer()
                    Text(result.winner)
                        .font(.headline)
                    Spacer()
                    Image("\(result.winner.prefix(1))1")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .frame(height: 30)
            }
        }
    }
}

#Preview {
    HistoryView()
}
