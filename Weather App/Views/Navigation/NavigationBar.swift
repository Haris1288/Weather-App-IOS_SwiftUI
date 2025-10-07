import SwiftUI

struct NavigationBar: View {
    @StateObject var ViewModel = NavigationBarViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:8) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing:5) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23).weight(.medium))
                            .foregroundStyle(Color.secondary)
                        Text("Weather")
                            .font(.title)
                            .foregroundStyle(Color.primary)
                    }
                    .frame(height: 44)
                    Spacer()
                    
                }

            }
            .frame(height: 52)
            
            HStack {
                HStack{
                    Image(systemName: "sparkle.magnifyingglass")
                        .foregroundStyle(Color.secondary)
                    TextField("Search for a city", text: $ViewModel.title)
                    
                }
                .padding(8)
                .background(Color.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray,lineWidth: 0.5)
                }
                Button {
                    Task{
                        await ViewModel.Search(title: ViewModel.title)
                    }
                  
                } label: {
                   Image(systemName: "magnifyingglass")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.gray)
                }
            }
            
        }
        .frame(height: 106,alignment: .top)
        .padding(.horizontal,16)
        .padding(.top,55)
        .backgroundBlur(radius: 20,opaque:true)
        .background(Color.navBarBackground)
        .frame(maxHeight: .infinity,alignment: .top)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationBar()
}
