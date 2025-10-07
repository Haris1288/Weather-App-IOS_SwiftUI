import Foundation

enum ForecastPeriod{
    case hourly
    case daily
}

struct WeatherData : Decodable {
    let location : Location
    let current : Current
    let forecast : Forecast
}

struct Location: Decodable {
    let name : String
}

struct Current: Decodable {
    let tempC : Double
    let windSpeed : Double
    let condition:Condition
    let humidity : Int
    let feelsLike : Double
    let visibility : Double
    let windDir : String
    
    enum CodingKeys : String,CodingKey {
    case tempC = "temp_c"
    case windSpeed = "wind_kph"
    case feelsLike = "feelslike_c"
    case visibility = "vis_km"
    case condition
    case humidity
    case windDir = "wind_dir"
    
    
    }
}

struct Condition:Decodable{
    let text : String
    let icon : String
}

struct Forecast:Decodable{
    let forecastday : [Forecastday]
    
}

struct Forecastday:Decodable {
    let date_epoch: TimeInterval
    let day : DayData
    let astro : Astro
    let hour: [HourData]
}

struct Astro: Decodable{
    let sunrise : String
    let sunset: String
}

struct HourData: Decodable {
    let time_epoch: TimeInterval
    let temp_c: Double
    let condition: Condition
    let chance_of_rain: Int
}

struct DayData : Decodable {
    let maxTemp : Double
    let minTemp : Double
    let condition: Condition
    let uv : Double
    
    enum CodingKeys : String,CodingKey {
    case maxTemp = "maxtemp_c"
    case minTemp = "mintemp_c"
    case condition
    case uv
    }
    
    
}

