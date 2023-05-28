//
//  DetailScreen.swift
//  FurnitureShop
//
//  Created by Akın Aksoy on 28.05.2023.
//

import SwiftUI


struct DetailScreen: View {
    @Environment(\.presentationMode) var presantationMode : Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                DescriptionView()
                    .offset(y: -40)
            }
            .edgesIgnoringSafeArea(.top)
            HStack {
                Text("$1299")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {}) {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(Color("Primary"))
                }
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(50, corners: .topLeft)
            .frame(maxHeight: .infinity,alignment: .bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                CustomBackButton(action:{presantationMode.wrappedValue.dismiss()
        }),trailing: Image("threeDot"))
    }
        
        
}
struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct DescriptionView: View {
    var body: some View {
        
            VStack(alignment: .leading) {
                Text("Luxury Swedia \nChair")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 4) {
                    ForEach(0 ..< 5) {item in
                        Image("star")
                    }
                    Text("(4.9)")
                        .opacity(0.5)
                        .padding(.leading,8)
                    Spacer()
                }
                Text("Description")
                    .fontWeight(.medium)
                    .padding(.vertical,8)
                Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. It carries on the simpicity....")
                    .lineSpacing(8)
                    .opacity(0.6)
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Size")
                            .padding(.bottom,4)
                            .fontWeight(.semibold)
                        Text("Height : 120 cm")
                            .opacity(0.6)
                        Text("Wide : 80 cm")
                            .opacity(0.6)
                        Text("Diameter : 72 cm")
                            .opacity(0.6)
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    VStack(alignment: .leading) {
                        Text("Treatment")
                            .fontWeight(.semibold)
                            .padding(.bottom,4)
                        Text("Jati Wood, Canvas, \nAmazing Love")
                            .opacity(0.6)
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                }.padding(.vertical)
                HStack(alignment: .top) {
                    VStack {
                        Text("Colors")
                            .fontWeight(.bold)
                        HStack {
                            
                            ColorView(color: .white)
                            ColorView(color: .black)
                            ColorView(color: Color("Primary"))
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Quality")
                            .fontWeight(.bold)
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "minus")
                                    .padding(.all,8)
                            }
                            .frame(width: 30,height: 30)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                            .foregroundColor(.black)
                            
                            Text("1")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                            
                            Button(action: {}) {
                                Image(systemName: "plus")
                                    .padding(.all,8)
                            }
                            .clipShape(Circle())
                            .background(Color("Primary"))
                            .foregroundColor(.white)
                        }
                    }
                }
                
                
                
                
            }
        
        .padding()
        .background(Color("Bg"))
        .cornerRadius(40)
    }
}

struct ColorView: View {
    let color : Color
    var body: some View {
        HStack {
            color
                .frame(width: 24,height: 24)
                .clipShape(Circle())
        }
    }
}

struct CustomBackButton: View {
    let action : ()-> Void
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .padding(.all,12)
                .background(Color.white)
                .cornerRadius(8)
                .foregroundColor(.black)
        })
        
    }
}
