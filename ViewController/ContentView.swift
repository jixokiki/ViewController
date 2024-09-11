//
//  ContentView.swift
//  ViewController
//
//  Created by  Rizki Maulana on 05/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var classSchedule: [String] = []

    var body: some View {
        VStack(spacing: 20) {
            // Your SwiftUI content here

            Button(action: {
                // Call function to show encouragement message
                showEncouragementMessage()
            }) {
                Text("Show Encouragement")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .buttonStyle(MyButtonStyle()) // Apply custom button style

            // Add other components with styles
            Link(destination: URL(string: "https://sso.esaunggul.ac.id/Dashboard#")!) {
                Text("Go to ESA Unggul Dashboard")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .buttonStyle(MyButtonStyle())

            // Button for displaying class schedule
            Button(action: {
                // Call function to fetch and display class schedule
                fetchClassSchedule()
            }) {
                Text("View Class Schedule")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .buttonStyle(MyButtonStyle())

            // Display class schedule in a List
            if !classSchedule.isEmpty {
                List(classSchedule, id: \.self) { scheduleItem in
                    Text(scheduleItem)
                }
            }
        }
        .padding(20)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Selamat Menjalani Kegiatan!"),
                  message: Text(encouragementMessage()),
                  dismissButton: .default(Text("OK")))
        }
    }

    func showEncouragementMessage() {
        // Set showAlert to true to trigger the presentation of the alert
        showAlert = true
    }

    func encouragementMessage() -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: currentDate)
        let currentTime = calendar.component(.hour, from: currentDate)

        switch dayOfWeek {
        case 2: // Senin
            return "Asikkk, kamu libur hari ini!"
        case 3: // Selasa
            return classMessage(forDay: "Selasa", atTime: currentTime)
        case 4: // Rabu
            return classMessage(forDay: "Rabu", atTime: currentTime)
        case 5: // Kamis
            return classMessage(forDay: "Kamis", atTime: currentTime)
        case 6: // Jumat
            return classMessage(forDay: "Jumat", atTime: currentTime)
        case 7: // Sabtu
            return classMessage(forDay: "Sabtu", atTime: currentTime)
        case 1: // Minggu
            return "Liburlah! Luangkan harimu sejenak untuk istirahat."
        default:
            return "Semangat menjalani agenda kampusmu!"
        }
    }

    func classMessage(forDay day: String, atTime time: Int) -> String {
        switch (day, time) {
        case ("Selasa", 8..<10):
            return "Hari ini ada kelas Pemrograman Mobile jam 8-10 di kelas KBM 105."
        case ("Selasa", 10..<12):
            return "Jangan lupa, ada kelas Jaringan Komputer jam 10-12 di kelas KBM 105."
        case ("Rabu", 8..<10):
            return "Selamat belajar! Ada kelas Pemrograman Mobile jam 8-10 di kelas KHIB 302."
        case ("Rabu", 13..<16):
            return "Sesi panjang hari ini! Ada kelas Software Quality Assurance jam 1-4 di kelas KHIB 205."
        case ("Kamis", 8..<10):
            return "Hari ini ada kelas Game Development jam 8-10 di kelas KHIB 501."
        case ("Kamis", 10..<12):
            return "Jangan ketinggalan, ada kelas Jaringan Komputer Lanjut jam 10-12 di kelas KHIB 501."
        case ("Kamis", 13..<16):
            return "Ada kelas Kapita Selekta Informatika jam 1-4 di kelas KHIB 502."
        case ("Kamis", 19..<21):
            return "Malam ini, ada kelas Kewirausahaan jam 7-9 di kelas KHIB 502."
        default:
            return "Semangat menjalani agenda kampusmu!"
        }
    }

    func fetchClassSchedule() {
        // Simulate fetching class schedule data
        classSchedule = [
            "Selasa, 8-10: Pemrograman Mobile, KBM 105",
            "Selasa, 10-12: Jaringan Komputer, KBM 105",
            "Rabu, 8-10: Pemrograman Mobile, KHIB 302",
            "Rabu, 13-16: Software Quality Assurance, KHIB 205",
            "Kamis, 8-10: Game Development, KHIB 501",
            "Kamis, 10-12: Jaringan Komputer Lanjut, KHIB 501",
            "Kamis, 13-16: Kapita Selekta Informatika, KHIB 502",
            "Kamis, 19-21: Kewirausahaan, KHIB 502"
        ]
    }
}

// Custom ButtonStyle
struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
