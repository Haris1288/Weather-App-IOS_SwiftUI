import SwiftUI

struct LocationRequestView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.background1
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.white)
                    .padding(.bottom, 32)
                
                Text("Please Allow the Location Permission to get current weather Location")
                    .foregroundStyle(Color.primary)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                    Button {
                        LocationManager.shared.requestLocation()
                        isPresented = false
                    } label: {
                        Text("Allow Location")
                            .padding()
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                    }
                    .background(Color.background2)
                    .clipShape(Capsule())
                    
                    Button {
                       
                        isPresented = false
                    } label: {
                        Text("Maybe later")
                            .padding()
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    LocationRequestView(isPresented: .constant(true))
        .preferredColorScheme(.dark)
}
