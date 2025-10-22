//
//  ControlFlows.swift
//  Revising_Swift
//
//  Created by Shushant  on 22/10/25.
//

import SwiftUI

struct ControlFlows: View {
    @State var darkModeEnabled:Bool = false
    @State var notificationEnabled:Bool =  true
    @State var faceIdEnabled:Bool = false
    
    
    var backGroundColor: Color {
        return darkModeEnabled ? .black : .white
    }
    
    var body: some View {
        VStack(alignment: .leading){
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(darkModeEnabled ? .white : .black)
                    .padding()
        
            
            
            VStack(alignment: .leading){
                Text("Appearance")
                    .font(.headline)
                    .foregroundStyle(darkModeEnabled ? .white : .black)
                
                Toggle(isOn: $darkModeEnabled) {
                    HStack{
                        Image(systemName: "moon.circle.fill")
                            .font(.title2)
                            .imageScale(.medium)
                            .foregroundStyle(.blue)
                        
                        
                        Text("Enable Dark Mode")
                            .font(.subheadline)
                            .foregroundStyle(darkModeEnabled ? .white : .black)
                    }
                    
                   
                }
                .padding(.horizontal)
                .frame(height: 50)
                .background(darkModeEnabled ?  .white.opacity(0.1) : Color(.systemGroupedBackground) )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .toggleStyle(SwitchToggleStyle(tint: .blue))
                
            }
            .padding()
            
            VStack(alignment: .leading){
                Text("Account")
                    .font(.headline)
                    .foregroundStyle(darkModeEnabled ? .white : .black)
                
                VStack{
                    Toggle(isOn: $notificationEnabled) {
                        HStack(alignment: .center){
                            Image(systemName: "bell.circle.fill")
                                .font(.title2)
                                .imageScale(.medium)
                                .foregroundStyle(.blue)
                            
                            
                            VStack(alignment: .leading){
                                Text("Notifications")
                                    .font(.subheadline)
                                    .foregroundStyle(darkModeEnabled ? .white : .black)
                                    .padding(.top, 14)
                                
                                Text(notificationEnabled ? "Push notification Enabled": "")
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                                
                                
                            }
                           
                        }
                        
                       
                    }
                    .padding(.horizontal)
                    .frame(height: 50)
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                    
                    Divider()
                    
                    Toggle(isOn: $faceIdEnabled) {
                        HStack{
                            Image(systemName: "faceid")
                                .font(.title2)
                                .imageScale(.medium)
                                .foregroundStyle(.blue)
                            
                            
                            Text("Enable Face Id")
                                .font(.subheadline)
                                .foregroundStyle(darkModeEnabled ? .white : .black)
                        }
                        
                       
                    }
                    .padding(.horizontal)
                    .frame(height: 50)
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                }
                .background(darkModeEnabled ?  .white.opacity(0.1) : Color(.systemGroupedBackground) )
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            
            
            Spacer()
        }
        .background(backGroundColor)
    }
        
}

#Preview {
    ControlFlows()
}
