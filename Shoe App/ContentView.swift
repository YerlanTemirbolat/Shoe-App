//
//  ContentView.swift
//  Shoe App
//
//  Created by Admin on 9/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    var black = Color.black.opacity(0.7)
    var width = UIScreen.main.bounds.width
    @State var more = false
    @State var gender = "Male"
    @State var size = 6
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var added = false
    @State var heart = false
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 22))
                            .frame(width: 40, height: 40)
                            .background(Color("red"))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                        
                        Spacer()
                        
                        Button(action: { heart.toggle() }) {
                            Image(systemName: "suit.heart")
                                .foregroundColor(heart ? Color("red") : black)
                                .font(.system(size: 22))
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                        }
                    }
                }
                
                Image("nike")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 65)
            }
            .padding()
            .padding(.top, 20)
            
            Image("boots")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width - (more ? 200 : 110))
                .padding(.top, 5)
            
            // For iPhones 6, 6s, 7, 8 and SE Second Gen...
            
            ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Nike Phantom II Boots")
                            .foregroundColor(black)
                            .font(.title2)
                            .fontWeight(.heavy)
                        
                        Spacer()
                        
                        Text("$650")
                            .foregroundColor(Color("red"))
                            .font(.title2)
                            .fontWeight(.heavy)
                    }
                    .padding(.top, 35)
                    .padding(.trailing)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("The 2nd generation Nike's Phantom VSN improces and evolves the seamless and snug fit, whilst maintaining the upper texture to aid in passing touch and striking the ball. With a reduced collar and streamlined silhouette.")
                            .foregroundColor(.black)
                            .lineLimit(more ? nil : 3)
                        
                        Button(action: { withAnimation { more.toggle() }}) {
                            Text("Read More")
                                .foregroundColor(Color("red"))
                                .fontWeight(.bold)
                        }
                    }
                    .padding([.vertical, .trailing])
                    
                    HStack(spacing: 15) {
                        Text("Gender")
                            .foregroundColor(black)
                            .fontWeight(.heavy)
                            .frame(width: 75, alignment: .leading)
                        
                        GenderButton(gender: $gender, title: "Male")
                        GenderButton(gender: $gender, title: "Female")
                        
                        Spacer()
                    }
                    .padding(.trailing)
                    .padding(.top, 10)
                    
                    HStack(spacing: 15) {
                        Text("Size")
                            .foregroundColor(black)
                            .fontWeight(.heavy)
                            .frame(width: 75, alignment: .leading)
                        
                        ForEach(sizes, id: \.self) { i in
                            SizeButton(size: $size, title: i)
                        }
                        
                        //Spacer()
                    }
                    .padding(.trailing)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    Button(action: { added.toggle() }) {
                        Label(title: {
                            Text(added ? "Added" : "Add to Bag")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.heavy)
                        }) {
                            Image(systemName: added ? "checkmark.circle.fill" : "cart.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                        }
                        .padding(.vertical, 12)
                        .frame(width: width - 75)
                        .background(added ? Color.green : Color("red"))
                        .clipShape(Capsule())
                        .padding(.leading, -45)
                        .padding(.top)
                        .padding(.bottom, edges!.bottom == 0 ? 15 : edges!.bottom)
                    }
                }
                .padding(.leading, 45)
            }
            .background(Color.white)
            .shadow(radius: 0)
            .clipShape(CustomShape())
            .padding(.top, 30)
            .shadow(color: Color.black.opacity(0.12), radius: 5, x: -5, y: -10)
        }
        .padding(.horizontal, -5)
        .background(Color("bg"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: 85, height: 85))
        return Path(path.cgPath)
    }
}

struct GenderButton: View {
    
    @Binding var gender: String
    var title: String
    var black = Color.black.opacity(0.7)
    
    var body: some View {
        VStack {
            Button(action: { gender = title }) {
                Text(title)
                    .foregroundColor(gender == title ? .white : .black)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(width: 80)
                    .background(gender == title ? Color("red") : Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
            }
        }
    }
}

struct SizeButton: View {
    
    @Binding var size: Int
    var title: Int
    var black = Color.black.opacity(0.7)
    
    var body: some View {
        VStack {
            Button(action: { size = title }) {
                Text("\(title)")
                    .foregroundColor(size == title ? .white : .black)
                    .font(.caption)
                    .fontWeight(.bold)
                    .frame(width: 35, height: 35)
                    .background(size == title ? Color("red") : Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
            }
        }
    }
}

var sizes = [6, 7, 8, 9, 10]
