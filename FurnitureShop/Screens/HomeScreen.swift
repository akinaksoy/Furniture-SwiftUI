//
//  HomeScreen.swift
//  FurnitureShop
//
//  Created by Akın Aksoy on 28.05.2023.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex : Int = 0
    private let categories = ["All","Chair","Sofa","Lamp","Kitchen","Table"]
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack(alignment: .leading){
                        AppBarView()
                        TagLineView()
                            .padding()
                        SearchView()
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count){ i in
                                    CategoryView(isActive: i == selectedIndex, text: categories[i]).onTapGesture {
                                        selectedIndex = i
                                    }
                                }
                            }
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { item in
                                    NavigationLink {
                                        DetailScreen()
                                    } label: {
                                        ProductView(image: Image("chair_\(item + 1)"),size: 210)
                                    }
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                }
                                
                                .padding(8)
                            }
                        }
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { item in
                                    ProductView(image: Image("chair_\(item + 1)"),size: 210)
                                }
                                .padding(8)
                            }
                        }
                        
                        
                        Spacer()
                    }
                }
                
                HStack {
                    BottomNavBarItem(image: Image("Home")) {                }
                    BottomNavBarItem(image: Image("fav")) {                }
                    BottomNavBarItem(image: Image("shop")) {                }
                    BottomNavBarItem(image: Image("User")) {                }
                    
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8,x: 2,y: 6)
                .frame(maxHeight: .infinity,alignment: .bottom)
            }
        }
    }
}
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action:{}) {
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)
            }
            Spacer()
            Button(action:{}) {
                Image("Profile")
                    .resizable()
                    .frame(width: 42,height: 42)
                    .cornerRadius(10)
            }
        }.padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text(" Furniture")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchView: View {
    @State private var searchText : String = ""

    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing,8)
                TextField("Search Furniture", text: $searchText)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            Button(action:{}) {
                Image(systemName: "qrcode.viewfinder")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading,spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.5))
            if isActive {
                Color("Primary")
                    .frame(width: 15,height: 2)
                    .clipShape(Capsule())
            }
            
        }
        .padding(.trailing)
    }
}

struct ProductView: View {
    let image: Image
    let size : CGFloat
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size,height: 200 * (size/210))
                .cornerRadius(24)
            Text("Luxury Swedian Chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(0 ..< 5){ i in
                    Image("star")
                }
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(24)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: {}) {
            Image("Home")
                .frame(maxWidth: .infinity)
        }
    }
}
