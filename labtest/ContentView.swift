import SwiftUI

struct ContentView: View {
     private var number: Int = Int.random(in: 1...500)
     private var correctCount = 0
     private var wrongCount = 0
     private var attempts = 0
     private var lastCorrect: Bool? = nil
     private var showSummary = false
     private var secondsLeft = 5
    // TODO: Update to your info
    private let fullName = "Blen Abebe"
    private let studentId = "YOUR_STUDENT_ID"
    private let crn = "YOUR_CRN"

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Time left: \(secondsLeft)s")
                    .font(.headline)
                Text("Prime / Not Prime")
                    .font(.largeTitle)
                    .bold()

                Text("\(number)")
                    .font(.system(size: 56, weight: .bold))

                HStack(spacing: 16) {
                    Button("Prime") {
                        handleAnswer(userSaysPrime: true)
                    }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)

                    Button("Not Prime") {
                        handleAnswer(userSaysPrime: false)
                    }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                }

                 HStack {
                    Text("Correct: \(correctCount)")
                    Spacer()
                    Text("Wrong: \(wrongCount)")
                }

                Spacer()

                NavigationLink("Profile") {
                    VStack(spacing: 8) {
                        Text("Full Name: \(fullName)")
                        Text("Student ID: \(studentId)")
                        Text("CRN: \(crn)")
                    }
                    .padding()
                }
            }
            .padding()
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            tick()
        }
        .alert("Summary (\(attempts) attempts)", isPresented: ) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Correct: \(correctCount)\nWrong: \(wrongCount)")
        }
        }
    }
}


        private func resetGame() {
        number = Int.random(in: 1...500)
        correctCount = 0
        wrongCount = 0
        attempts = 0
        lastCorrect = nil
        secondsLeft = 5
        showSummary = false
    }

    private func isPrime(_ n: Int) -> Bool {
        if n < 2 { return false }
        if n == 2 { return true }
        if n % 2 == 0 { return false }
        var i = 3
        while i * i <= n {
            if n % i == 0 { return false }
            i += 2
        }
        return true
    }
}

#Preview {
    ContentView()
}
