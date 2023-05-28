//
//  ContentView.swift
//  FurnitureShop
//
//  Created by Akın Aksoy on 27.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            HomeScreen()
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat,corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius,corners: corners))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




