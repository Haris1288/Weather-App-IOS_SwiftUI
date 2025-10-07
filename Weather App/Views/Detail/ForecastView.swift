import SwiftUI

struct ForecastViews: View {
    var bottomSheetTranslationProrated: CGFloat = 1
    @ObservedObject var viewModel : HomeViewModel
    @State private var selection = 0
    
    
    var body: some View {
        
        VStack(spacing:0) {
            RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black.opacity(0.3))
                            .frame(width: 48, height: 5)
                            .frame(height: 20)
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // MARK: Segmented Control
                    SegementedControl(selection: $selection)
                    
                    // MARK: Forecast Cards
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            if selection == 0 {
                                hourlySection
                                    .transition(.offset(x: -430))
                            } else {
                                dailySection
                                    .transition(.offset(x: 430))
                            }
                        }
                        .padding(.vertical, 20)
                    }
                    .padding(.horizontal, 20)
                    
                    // MARK: Forecast Widgets
                    LocationWeatherDetails(viewModel: viewModel)
                        .opacity(bottomSheetTranslationProrated)
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .overlay(content: {
            RoundedRectangle(cornerRadius: 44)
                .stroke(Color.bottomSheetBorderMiddle, lineWidth: 1)
                .blendMode(.overlay)
        })
        .overlay {
            // MARK: BottomSheet separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
    }
    
    // MARK: - Sections
    
    private var hourlySection: some View {
        ForEach(viewModel.hourlyForecasts, id: \.time_epoch) { hour in
            ForecastCard(
                iconURL: hour.condition.icon,
                date: Date(timeIntervalSince1970: hour.time_epoch),
                forcastPeriod: .hourly
            )
        }
       
    }
    
    private var dailySection: some View {
        ForEach(viewModel.weeklyForecasts, id: \.date_epoch) { day in
            ForecastCard(
                iconURL: day.day.condition.icon,
                date: Date(timeIntervalSince1970: day.date_epoch),
                forcastPeriod: .daily
            )
        }
        
    }
}

#Preview {
    ForecastViews(viewModel: HomeViewModel())
        .background(Color.background)
        .preferredColorScheme(.dark)
}
