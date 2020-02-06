//
//  ContentView.swift
//  10_02_Scrolling_02
// An exercise file for iOS Development Tips Weekly
// A weekely course on LinkedIn Learning for iOS developers
//  Season 10 (Q2 2020) video 02
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
// This Week:  Learn how to use SwiftUI ScrollViews for more dynamic apps.
//  For more code, go to http://bit.ly/AppPieGithub

import SwiftUI

let colors:[Color] = [.black,.red,Color(.orange),.yellow,.green,Color(.cyan),.blue,Color(.magenta)]
let colorNames = ["Black","Red","Orange","Yellow","Green","Cyan","Blue","Magenta"]

struct ContentView:View {
    @State var color:Color = .black
    @State var colorIndex:Int = 0
    @State var  number = 0
    @State var zoom:Bool = false
    @State var count:Int = 25
    @State var fill:Bool  = true
    @State var circle:Bool = true
    var systemName:String{
        let c = circle ? ".circle" : ".square"
        let f = fill ? ".fill" : ""
        return "\(number)" + c + f
    }
    
    var body: some View{
        VStack{
            //Title
            Text(colorNames[colorIndex] + " " + systemName)
                .font(.title)
                .fontWeight(.bold)
            
            //Image Preview
            ScrollView([.horizontal,.vertical], showsIndicators:false){
            HStack{
                Image(systemName: systemName)
                    .resizable()
                    .frame(width:zoom ? 200:100, height:zoom ? 200:100)
                    .foregroundColor(colors[colorIndex])
                    .onTapGesture {
                        self.zoom.toggle()
                }//TapGesture
            } //HStack - Header Image
                }//scrollview
                .frame(width:150, height:150)
            
           //Numbers
            ScrollView{
            VStack{
                    ForEach(0...50,id:\.self){ number in
                        Text("\(number)")
                            .font(.largeTitle)
                            .onTapGesture {
                                self.number = number
                        }//tap
                    }//For Each
                } //Vstack - Numbers
                
            }//scrollview
                .frame(height:125)
                    .padding()
                
            
            //Colors
            ScrollView(.horizontal){
            HStack{
                    ForEach(0..<colors.count,id: \.self){colorIndex in
                        ZStack{
                       
                            Image(systemName: "square.fill")
                            .resizable()
                            .frame(width: 75, height: 75, alignment: .center)
                            .foregroundColor(colors[colorIndex])
                            .onTapGesture {
                                self.colorIndex = colorIndex
                        
                        }//onTapGesture
                             Text(colorNames[colorIndex])
                                .foregroundColor(colorIndex == 0 ? .white : .black)
                        }//ZStack
                    }//ForEach
                }//HStack - Colors
                
            }//scrollview
                .padding()
            
            //Fill and Shape
            HStack{
                Button(action:{self.fill.toggle()}){
                    Text(fill ? "Fill" : "Hollow")
                }//Button
                    .frame(width:150, height: 50)
                    .font(.headline)
                    .background(Color(.secondarySystemFill))
                    .cornerRadius(10)
                    .padding()
                Button(action:{self.circle.toggle()}){
                    Text(circle ? "Circle" : "Square")
                }//Button
                    .frame(width:150, height: 50)
                    .font(.headline)
                    .background(Color(.secondarySystemFill))
                    .cornerRadius(10)
                    .padding()
            }//HStack - Fill and Shape
            
            Spacer()
        }//VStack
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
