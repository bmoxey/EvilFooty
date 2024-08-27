//
//  CurrentView.swift
//  EvilFooty
//
//  Created by Brett Moxey on 26/8/2024.
//

import SwiftUI
import SpriteKit

class ParticleScene: SKScene {
    private var emitter: SKEmitterNode?

    override init(size: CGSize) {
        super.init(size: size)

        backgroundColor = .clear

        if let emitter1 = SKEmitterNode(fileNamed: "MyParticle") {
            emitter1.position.y = size.height
            emitter1.particleColorSequence = nil
            emitter1.particleColorBlendFactor = 1
            emitter1.particleColorBlueRange = 1
            emitter1.particleColorGreenRange = 1
            emitter1.particleColorRedRange = 1
            emitter1.position.x = size.width / 2
            addChild(emitter1)
            self.emitter = emitter1
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setParticleCount(_ count: CGFloat) {
        emitter?.particleBirthRate = count
    }
    
    func isEmitterActive() -> Bool {
        return emitter?.particleBirthRate ?? 0 > 0
    }
}

struct CurrentView: View {
    @State private var graphic: String = "B1"
    @State private var particleScene: ParticleScene?
    @State private var timer: Timer?
    @State private var isEmitterActive = false

    var winner: String {
        results.max(by: { $0.year < $1.year })?.winner ?? "No Winner"
    }

    func generateGraphic() -> String {
        let firstLetter = winner.prefix(1)
        let randomNumber = Int.random(in: 1...16)
        return "\(firstLetter)\(randomNumber)"
    }
    
    func startTimer() {
        timer?.invalidate()
        let particleCount = CGFloat(Int.random(in: 10...300))
        particleScene?.setParticleCount(particleCount)
        isEmitterActive = true
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(Int.random(in: 1...15)), repeats: false) { _ in
            particleScene?.setParticleCount(0)
            isEmitterActive = false
        }
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                SpriteView(scene: particleScene ?? ParticleScene(size: geo.size), options: [.allowsTransparency])
                    .onAppear {
                        if particleScene == nil {
                            particleScene = ParticleScene(size: geo.size)
                        }
                        startTimer()
                    }
                    .onDisappear {
                        timer?.invalidate()
                        particleScene?.setParticleCount(0)
                        isEmitterActive = false
                    }
            }
            VStack {
                Text("Current Champion")
                    .font(.title2)
                Spacer()
                Text("\(results.max(by: { $0.year < $1.year })?.year.description ?? "0")")
                    .font(.largeTitle)
                Image(graphic)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .onTapGesture { graphic = generateGraphic() }
                    .onAppear { graphic = generateGraphic() }
                Text("\(winner)")
                    .font(.largeTitle)
                Spacer()
                if !isEmitterActive {
                    Button("Glory to the Champion!") { startTimer() }
                } else {
                    Text(" ")
                }
            }
        }
    }
}

#Preview {
    CurrentView()
}
