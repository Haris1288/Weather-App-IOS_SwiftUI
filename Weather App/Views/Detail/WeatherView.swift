import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = NavigationBarViewModel()


    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing:20) {
                    if viewModel.showWidget{
                        WeatherWidget(ViewModel:viewModel)
                        
                        LocationWeatherDetailsCustomSearch(viewModel: viewModel)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 100)
            }
        }
        .overlay{
            NavigationBar(ViewModel:viewModel)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WeatherView()
        .preferredColorScheme(.dark)
}
