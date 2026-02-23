import SwiftUI

struct ContentView: View {
     private var number: Int = Int.random(in: 1...200)
    // TODO: Update to your info
    private let fullName = "Blen Abebe"
    private let studentId = "YOUR_STUDENT_ID"
    private let crn = "YOUR_CRN"

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Prime / Not Prime")
                    .font(.largeTitle)
                    .bold()

                Text("\(number)")
                    .font(.system(size: 56, weight: .bold))

                HStack(spacing: 16) {
                    Button("Prime") {}
                        .buttonStyle(.borderedProminent)

                    Button("Not Prime") {}
                        .buttonStyle(.borderedProminent)
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
        }
    }
}

#Preview {
    ContentView()
}
