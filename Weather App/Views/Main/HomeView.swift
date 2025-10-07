import SwiftUI
import BottomSheet

struct HomeView: View {
    
    @ObservedObject var locationManager = LocationManager.shared
    @State var isPresented = true
    @State var selectedDetent: BottomSheet.PresentationDetent = .small
    @State var bottomSheetTranslation: CGFloat = BottomSheet.PresentationDetent.small.size
    @State var hasDragged : Bool = false
    @StateObject var viewModel = HomeViewModel()
    @State private var hasFetchedInitialLocation = false
    @State private var isShowingLocationRequest = true
    
    var bottomSheetTranslationProrated : CGFloat{
        let minHeight: CGFloat = 0.4
        let maxHeight: CGFloat = 0.8
        let progress = (bottomSheetTranslation - minHeight) / (maxHeight - minHeight)
        return max(0, min(1, progress))
        
    }
    
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                
                let imageOffset = screenHeight + 36
                ZStack {
                    //MARK: Background
                    Color.background
                    
                    //MARK: Background Image
                    Image("Background")
                        .resizable()
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    //MARK: Image House
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top )
                        .padding(.top,287)
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    Group{
                        VStack(spacing: -10 * (1-bottomSheetTranslation)){
                            Text(viewModel.name.capitalized)
                                .font(.largeTitle)
                            VStack{
                                Text(attributedString)
                                    .multilineTextAlignment(.center)
                                
                                
                                Text("H:\(viewModel.highTemp,specifier:"%.1f")° L:\(viewModel.lowTemp, specifier: "%.1f")°")
                                    .font(.title3.weight(.semibold))
                                    .opacity(1 - bottomSheetTranslationProrated)
                            }
                            Spacer()
                        }
                    }
                    .offset(y: -bottomSheetTranslationProrated * 46)
                    .padding(.top,100)
                    .sheetPlus(isPresented: $isPresented,background:
                                Blur(radius: 25,opaque: true) .clipShape(RoundedRectangle(cornerRadius: 44)),
                               onDrag: { translation in
                        bottomSheetTranslation = translation/screenHeight
                        
                        withAnimation(.easeOut){
                            if selectedDetent == BottomSheet.PresentationDetent.fraction(0.8){
                                hasDragged = true
                            }else{
                                hasDragged = false
                            }
                        }
                        
                    }
                    ) {
                        Group{
                            ForecastViews(viewModel: viewModel)
                            
                        }
                        .presentationDetentsPlus(
                            [.fraction(0.4),.fraction(0.5), .fraction(0.8)],
                            selection: $selectedDetent)
                        
                    }
                    
                    TabBar(action: {
                        if let location = locationManager.userLocation {
                            
                            Task {
                                let coordinateQuery = "\(location.coordinate.latitude),\(location.coordinate.longitude)"
                                await viewModel.fetchWeatherData(name: coordinateQuery)
                                print("Refreshed weather for current location.")
                                selectedDetent = .large
                            }
                        } else {
                            
                            isShowingLocationRequest = true
                            print("Location not available. Showing request sheet.")
                        }
                        
                        
                    })
                    .offset(y:bottomSheetTranslationProrated * 150)
                    
                    
                }
                .ignoresSafeArea()
            }
        }
        .onChange(of: LocationManager.shared.userLocation) { oldValue, newValue in
            guard !hasFetchedInitialLocation, let location = newValue else { return }
            Task {
                let coordinateQuery = "\(location.coordinate.latitude),\(location.coordinate.longitude)"
                await viewModel.fetchWeatherData(name: coordinateQuery)
                hasFetchedInitialLocation = true
            }
        }
        .sheet(isPresented: $isShowingLocationRequest) {
            
            LocationRequestView(isPresented: $isShowingLocationRequest)
            
                .interactiveDismissDisabled()
        }
        
        .onAppear {
            Task {
                await viewModel.fetchWeatherData(name: "patna")
            }
        }
        
        
    }
    private var attributedString : AttributedString {
        let formattedTemp = String(format: "%.0f", viewModel.temprature)
        var string = AttributedString("\(formattedTemp)°" + (hasDragged ? " | " : "\n") + "\(viewModel.conditiontText)" )
        
        if let temp = string.range(of:"\(formattedTemp)°" ){
            string[temp].font = .system(size: (96 - (bottomSheetTranslationProrated * (96 - 25))),weight: .thin)
            string[temp].foregroundColor = .primary
        }
        
        if let pipe = string.range(of: " | "){
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        
        if let weather = string.range(of:"\(viewModel.conditiontText)"){
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        
        return string
    }
}



#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
