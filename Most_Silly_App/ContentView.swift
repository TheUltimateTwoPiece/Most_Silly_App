import SwiftUI

struct ContentView: View {

    //  Game Information

    @State private var score = 0
    @State private var lives = 3
    @State private var coins = 0
    @State private var highScore = 0
    @State private var memesCaught = 0
    @State private var meme = "💀"
    @State private var message = "Catch the tuffest memes!"
    @State private var gameOver = false
    @State private var bananaHat = false
    @State private var brainCell = false
    @State private var petRock = false

    let goodMemes = ["💀", "🔥", "😎", "🗿", "🍌", "🦆"]
    let badMemes = ["🤡", "💩", "😭", "🥶"]

    var body: some View {

        TabView {

            gameView
                .tabItem {
                    Label("Game", systemImage: "gamecontroller")
                }

            shopView
                .tabItem {
                    Label("Shop", systemImage: "cart")
                }

            statsView
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
        }
        .onAppear {
            newMeme()
        }
    }

  // all views:)

    var gameView: some View {

        ScrollView {

            VStack(spacing: 20) {

                Text("💀 MEME CATCHER 💀")
                    .font(.largeTitle)
                    .bold()

                Text("Score: \(score) 🏆")
                Text("Lives: \(lives) ❤️")
                Text("Dodge Coins: \(coins) 🪙")

                Text(meme)
                    .font(.system(size: 100))

                Text(message)
                    .font(.headline)
                    .multilineTextAlignment(.center)

    if gameOver {

        Button("REVIVE MY BRAIN 🧠") {
        restartGame()
            }
        .buttonStyle(.borderedProminent)

    } else {

        HStack {
        Button("CATCH 🫴") {
                catchMeme()
                    }
        .buttonStyle(.borderedProminent)

        Button("SKIP 🏃") {
            skipMeme()
                        }
        .buttonStyle(.bordered)
                    }
                }

                Divider()
                Text("USELESS BUTTON COLLECTION (scroll down)")
                    .font(.headline)
                    .bold()

        Button("🦆 Summon a Duck") {
                    message = "A duck has appeared. It pays no rent."
                }

        Button("🥔 Become a Potato") {
                    message = "Congratulations. You are now a potato."
                }

        Button("🧠 Check Brain Cells") {
                    message = brainCell
                        ? "Your brain cell is working overtime."
                        : "Brain cell not found."
                }

        Button("🗿 Check Your Aura") {
                    message = [
                        "Aura: -999999",
                        "Aura: suspiciously average",
                        "Aura: 0.0001",
                        "Aura: certified refrigerator",
                        "Aura: MOAI APPROVED 🗿"
                    ].randomElement()!
                }

                Button("🗣️ Give a Motivational Speech") {
                    message = "INDEED, YOU CAN DO IT i think"
                }

                Button("🚀 Launch Into Space") {
                    message = " failed. You forgot the rocket."
                }

                Button("🧹 Clean My Room") {
                    message = "Your room is now 0.0001% cleaner."
                }

                Button("🐸 Summon the Frog Council") {
                    message = "The frog council has rejected your application."
                }

                Button("💸 Check Bank Account") {
                    message = "Your Dodge Coins are not legal tender."
                }
            }
            .font(.title3)
            .padding()
        }
    }

    //Shop

    var shopView: some View {

        ScrollView {

            VStack(spacing: 20) {

                Text("🛒 MEME SHOP")
                    .font(.largeTitle)
                    .bold()

                Text("Coins: \(coins) 🪙")

                Button("❤️ Buy 1 Life — 20 Coins") {
                    if coins >= 20 {
                        coins -= 20
                        lives += 1
                        message = "You purchased survival."
                    } else {
                        message = "BROKE DETECTED. 💀"
                    }
                }

                Button(bananaHat
                       ? "🍌 Banana Hat — OWNED"
                       : "🍌 Buy Banana Hat — 50 Coins") {

                    if coins >= 50 && !bananaHat {
                        coins -= 50
                        bananaHat = true
                        message = "You have acquired banana fashion."
                    } else if bananaHat {
                        message = "You already have the banana drip."
                    } else {
                        message = "Not enough coins. Get a job."
                    }
                }

                Button(brainCell
                       ? "🧠 Brain Cell — OWNED"
                       : "🧠 Buy Brain Cell — 100 Coins") {

                    if coins >= 100 && !brainCell {
                        coins -= 100
                        brainCell = true
                        message = "Brain cell successfully installed."
                    } else if brainCell {
                        message = "You cannot own two brain cells."
                    } else {
                        message = "Your wallet is suffering."
                    }
                }

                Button(petRock
                       ? "🪨 Pet Rock — OWNED"
                       : "🪨 Buy Pet Rock — 75 Coins") {

                    if coins >= 75 && !petRock {
                        coins -= 75
                        petRock = true
                        message = "Your rock does absolutely nothing."
                    } else if petRock {
                        message = "Your rock is still a rock."
                    } else {
                        message = "You cannot afford a rock."
                    }
                }

                Button("💰 Donate 10 Coins to the Duck") {
                    if coins >= 10 {
                        coins -= 10
                        message = "The duck thanks you and buys a yacht."
                    } else {
                        message = "The duck says you are broke."
                    }
                }

                Button("🔥 Buy Absolutely Nothing — 25 Coins") {
                    if coins >= 25 {
                        coins -= 25
                        message = "Congratulations! You got nothing."
                    } else {
                        message = "Even nothing is too expensive."
                    }
                }
            }
            .font(.title3)
            .padding()
        }
    }

    //  Statistics

    var statsView: some View {

        VStack(spacing: 25) {

            Text("📊 YOUR STATISTICS")
                .font(.largeTitle)
                .bold()

            Text("🏆 Current Score: \(score)")
            Text("🥇 High Score: \(highScore)")
            Text("❤️ Remaining Lives: \(lives)")
            Text("🪙 Total Coins: \(coins)")
            Text("🎯 Memes Caught: \(memesCaught)")
            Text("🍌 Banana Hat: \(bananaHat ? "useless junk" : "NO")")
            Text("🧠 Brain Cell: \(brainCell ? "u still have 0" : "NO")")
            Text("🪨 Pet Rock: \(petRock ? "it does nothing" : "NO")")

            Spacer()

            Text("Statistics nobody asked for.")
                .italic()
        }
        .font(.title2)
        .padding()
    }

    // Catch Meme

    func catchMeme() {

        if goodMemes.contains(meme) {

            score += 1
            memesCaught += 1
            message = "I guess you caught it bro"

        } else {

            loseLife()
            message = " no way you fell for that"
        }

        finishTurn()
    }

    //  Skip Meme

    func skipMeme() {

        if badMemes.contains(meme) {

            score += 1
            message = "ok lah good doudge"

        } else {

            loseLife()
            message = "you skip the good one sia"
        }

        finishTurn()
    }

    //  Game Mechanics

    func loseLife() {
        lives -= 1
    }

    func finishTurn() {

        if score > highScore {
            highScore = score
        }

        if lives <= 0 {
            gameOver = true
            coins += score
            message = "YOU LOSE!HAHA! YOU EARNED \(score) COINS."
            return
        }

        if Int.random(in: 1...8) == 1 {

            message = [
                " Your fridge has declared war cus u eat too much out of it.",
                "🥔 You have been turned to potato.",
                "🦆 Duck inspection in progress.",
                " son? that was a bad meme.",
                "🍌 Banana detected in your location. WATCH OUT AH"
            ].randomElement()!
        }

        newMeme()
    }

    func newMeme() {

        meme = (goodMemes + badMemes).randomElement() ?? "💀"
    }

    //  Restart

    func restartGame() {

        score = 0
        lives = 3
        memesCaught = 0

        gameOver = false
        message = "aiya ok you come back again"

        newMeme()
    }
}

#Preview {
    ContentView()
}
