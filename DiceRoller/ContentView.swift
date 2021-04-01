

import SwiftUI
import Combine

struct ContentView: View {
    
    @State var rollNumber = 20
    @State var randomNumber = Int.random(in: 1...6)
 
    let timer = Timer.publish(every: 0.20, on: .main, in: .common).autoconnect()

     var body: some View {
        HStack{
           
    Image("D\(rollNumber)")
             .onReceive(timer) { _ in
                 if self.rollNumber > 0 {
                     self.rollNumber -= 1
                 }
            
                 }
            if self.rollNumber == 0 {
                Image("D\(randomNumber)")
                
                 }
            
             }
        
     }
     
    
 




// 2
struct ImageCarouselView<Content: View>: View {
    // 3
    private var numberOfImages: Int
    private var content: Content

    // 4
    @State private var currentIndex: Int = 0
    
    // 5
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    // 6
    init(numberOfImages: Int, @ViewBuilder content: () -> Content) {
        self.numberOfImages = numberOfImages
        self.content = content()
    }

    var body: some View {
        content
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        
        // 7
        ImageCarouselView(numberOfImages: 3) {
            Text("Hello World")
        }
    }
}
}

