import SwiftUI

struct ForecastCard: View {
    
    let iconURL: String
    let date: Date
    var forcastPeriod : ForecastPeriod
    
    var isActive : Bool {
        if forcastPeriod == ForecastPeriod.hourly{
            return Calendar.current.isDate(.now, equalTo: date, toGranularity: .hour)
        }else {
            return Calendar.current.isDate(.now, equalTo: date, toGranularity: .day)
        }
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.forecastCardBackground.opacity(isActive ? 1 : 0.2))
                .frame(width: 60,height: 146)
                .shadow(color: .black.opacity(0.25), radius: 10,x: 5,y: 4)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.white.opacity(isActive ? 0.5 : 0.2))
                        .blendMode(.overlay)
                }
            
            VStack(spacing: 16) {
                //MARK: Forcast date
                Text(date,format: forcastPeriod == ForecastPeriod.hourly ? .dateTime.hour() : .dateTime.weekday())
                    .font(.subheadline.weight(.semibold))
                VStack(spacing: -4) {
                    //Image("\(forcast.icon) small")
                    
                    AsyncImage(url: URL(string:"https:\(iconURL)"))
                    { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 42, height: 42)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 42, height: 42)
                    }
                    
                    //                    Text(forcast.probability,format: .percent)
                    //                        .font(.footnote.weight(.semibold))
                    //                        .foregroundStyle(.probabilityText)
                    //                        .opacity(forcast.probability > 0 ? 1 : 0)
                    
                }
               // .frame(height: 42)
                
                //                Text("\(forcast.temperature)°")
                //                    .font(.title3)
            }
            .padding(.horizontal,8)
            .padding(.vertical,16)
            .frame(width: 60,height: 146)
            
        }
        
    }
}

#Preview {
    ForecastCard(iconURL: "//cdn.weatherapi.com/weather/64x64/day/113.png", date: Date.now, forcastPeriod: .hourly)
}
