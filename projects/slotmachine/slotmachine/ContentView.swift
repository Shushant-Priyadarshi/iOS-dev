import SwiftUI


enum Choice:Int,Identifiable{
    var id:Int{
        rawValue
    }
    case success,failure
}

struct ContentView: View {
    @State public var symbols = ["eating" ,"happy","love"]
    @State public var number = [0,1,2]
    @State public var counter = 0
    @State private var showingAlert:Choice?
    @State private var attempts:Int = 5
    
    var body: some View {
        ZStack {
           Image("sunshine")
                .resizable()
                .ignoresSafeArea(.all)
            VStack(alignment: .center, spacing: 50){
                //slot machine heading
                HStack{
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .orange, radius: 1,y:3)
                    Text("Slot Machine")
                        .font(.system(size: 30))
                        .fontWeight(.black)
                        .shadow(color: .orange, radius: 1,y:3)
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .orange, radius: 1,y:3)
                }.frame(width: 600, height: 50,alignment: .center)
                
                HStack(alignment: .center){
                    Text("Attemps left: \(attempts)")
                        .fontWeight(.black)
                        .font(.system(size: 22))
                        .shadow(color: .orange, radius: 2,y:1)
                }
                VStack(alignment: .center, spacing: 15){
                    //top two
                    HStack(spacing: 35){
                        Hexagon()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[number[2]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color:.gray,radius: 4,x:4,y:5)
                            )
                        Hexagon()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[number[1]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color:.gray,radius: 4,x:4,y:5)
                            )
                    }
                    //middle one
                    Hexagon()
                        .fill(Color.white.opacity(0.8))
                        .frame(width: 100, height: 120, alignment: .center)
                        .overlay(
                            Image(symbols[number[0]])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80,height: 70,alignment: .center)
                                .shadow(color:.gray,radius: 4,x:4,y:5)
                        )
                    //bottom two
                    HStack(spacing: 35){
                        Hexagon()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[number[1]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color:.gray,radius: 4,x:4,y:5)
                            )
                        Hexagon()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[number[2]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 70,alignment: .center)
                                    .shadow(color:.gray,radius: 4,x:4,y:5)
                            )
                    }
                    Button {
                        self.number[0] = Int.random(in: 0...number.count - 1)
                        self.number[1] = Int.random(in: 0...number.count - 1)
                        self.number[2] = Int.random(in: 0...number.count - 1)
                        
                        counter += 1
                        attempts -= 1
                        
                        if(number[0] == number[1] && number[1] == number[2]){
                            self.showingAlert = .success
                            counter = 0
                            attempts = 5
                        }
                        
                        if(counter > 4){
                            self.showingAlert = .failure
                            counter = 0
                            attempts = 5
                        }
                      
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("slot-color"))
                            .overlay(Text("Spin")
                                .fontWeight(.black)
                                .font(.title3)
                            ).foregroundColor(.black)
                            .frame(width: 200, height: 40, alignment: .center)
                            .shadow(color: .gray, radius: 1, y:4)
                    }

                    
                }
                .alert(item: $showingAlert) { alert -> Alert in
                    switch alert{
                    case .failure:
                        return Alert(title: Text("Oops!"), message: Text("Better luck next time"),
                                     dismissButton: .cancel())
                    case .success:
                        return Alert(title: Text("Winner!"), message: Text("Yea! You won"),
                                     dismissButton: .cancel())
                    
                    }
                
                }
            }
           
        }
   
    }
}

#Preview {
    
    ContentView()
}
