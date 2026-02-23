//
//  ContentView.swift
//  labtest1
//
//  Created by Blen Abebe on 2026-02-22.
//
import SwiftUI

struct StudentInfoView: View {
    @Environment(\.dismiss) private var dismiss

    let fullName: String
    let studentId: String
    let crn: String

    var body: some View {
            VStack{
                Text("Full Name: \(fullName)")
                Text("Student ID: \(studentId)")
                Text("CRN: \(crn)")
            }
            Button("Back") {
                dismiss()
        }
    }
}


struct ContentView: View {
    @State private var earnedText: String = ""
    @State private var possibleText: String = ""

    @State private var percentResult: Float? = nil

    private let fullName = "Sara Yohannes"
    private let studentId = "101543366"
    private let crn = "50497"
    

    var body: some View {
        NavigationStack {
            VStack {
                Text("Percent Calculator")
                    .font(.title2)

                TextField("Points Earned", text: $earnedText)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)

                TextField("Points Possible", text: $possibleText)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)

                Text("Percent = \(percentDisplay)")
                    .font(.headline)

                HStack {
                    Button("Calculate") {
                        calculatePercent()
                    }
                    .buttonStyle(.bordered)

                    Button("Reset") {
                        resetAll()
                    }
                    .buttonStyle(.bordered)
                }


                NavigationLink("Profile") {
                    StudentInfoView(fullName: fullName, studentId: studentId, crn: crn)
                }
                .buttonStyle(.bordered)
            }
        }
    }

    private var percentDisplay: String {
        if let value = percentResult {
            return String(value)
        } else {
            return "--"
        }
    }

    private func calculatePercent() {
        guard let earnedInt = Int(earnedText),
              let possibleInt = Int(possibleText),
              possibleInt != 0
        else {
            percentResult = nil
            return
        }

        let earned = Float(earnedInt)
        let possible = Float(possibleInt)
        percentResult = (earned / possible) * 100.0
    }

    private func resetAll() {
        earnedText = ""
        possibleText = ""
        percentResult = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
