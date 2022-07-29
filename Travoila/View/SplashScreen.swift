//
//  SplashScreen.swift
//  Travoila
//
//  Created by Patrick Louis on 14/05/22.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 1.0
    
    var body: some View {
        if isActive {
            OnBoardingView()
        } else {
            ZStack {
                Color("CustomColor")
                    .ignoresSafeArea()
                VStack {
                    HStack (spacing: 10){
                        Image("Travoila")
                            .resizable()
                            .frame(width: 95, height: 82)
                        Text("Travoila!")
                            .font(.system(size: 48, weight: .medium))
                            .foregroundColor(.white)
                        
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
    
    struct SplashScreen_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreen()
        }
    }
}
