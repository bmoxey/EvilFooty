//
//  ChartView.swift
//  EvilFooty
//
//  Created by Brett Moxey on 26/8/2024.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        VStack {
            Text("Wins Per Person")
                .font(.title2)
            Spacer()
                .frame(height: 50)
            Chart {
                ForEach(winsPerPerson.sorted(by: { $0.value > $1.value }), id: \.key) { winner, wins in
                    BarMark(
                        x: .value("Person", winner),
                        y: .value("Wins", wins)
                    )
                    .foregroundStyle(by: .value("Person", winner))
                    .annotation(position: .overlay) {
                        Text("\(wins)")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    .annotation(position: .top) {
                        Image("\(winner.prefix(1))1")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                }
            }
            .chartLegend(.hidden)
            .padding()
            Spacer()
                .frame(height: 50)
        }
    }
}

#Preview {
    ChartView()
}
