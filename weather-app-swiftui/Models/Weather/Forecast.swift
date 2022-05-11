import Foundation

struct Forecast: Codable {
  let location: RealtimeWeatherLocation
  let current: RealtimeWeatherCurrent?
  let forecast: ForecastModel
}

struct ForecastModel: Codable {
  let forecastday: [ForecastDay]
}

struct ForecastDay: Codable, Identifiable {
  let id = UUID().uuidString
  let date: String
  let dateEpoch: Int
  let day: DayModel
  let astro: Astro
  let hour: [Hour]

  enum CodingKeys: String, CodingKey {
    case date
    case dateEpoch = "date_epoch"
    case day, astro, hour
  }
}

struct Astro: Codable {
  let sunrise, sunset, moonrise, moonset: String
  let moonPhase, moonIllumination: String

  enum CodingKeys: String, CodingKey {
    case sunrise, sunset, moonrise, moonset
    case moonPhase = "moon_phase"
    case moonIllumination = "moon_illumination"
  }
}

struct DayModel: Codable {
  let maxtempC, maxtempF, mintempC, mintempF: Double
  let avgtempC, avgtempF, maxwindMph, maxwindKph: Double
  let totalprecipMm, totalprecipIn, avgvisKm, avgvisMiles, avghumidity: Double
  let dailyWillItRain, dailyChanceOfRain: Int
  let dailyWillItSnow, dailyChanceOfSnow: Int
  let condition: RealtimeWeatherCurrentCondition
  let uv: Double

  enum CodingKeys: String, CodingKey {
    case maxtempC = "maxtemp_c"
    case maxtempF = "maxtemp_f"
    case mintempC = "mintemp_c"
    case mintempF = "mintemp_f"
    case avgtempC = "avgtemp_c"
    case avgtempF = "avgtemp_f"
    case maxwindMph = "maxwind_mph"
    case maxwindKph = "maxwind_kph"
    case totalprecipMm = "totalprecip_mm"
    case totalprecipIn = "totalprecip_in"
    case avgvisKm = "avgvis_km"
    case avgvisMiles = "avgvis_miles"
    case avghumidity
    case dailyWillItRain = "daily_will_it_rain"
    case dailyChanceOfRain = "daily_chance_of_rain"
    case dailyWillItSnow = "daily_will_it_snow"
    case dailyChanceOfSnow = "daily_chance_of_snow"
    case condition, uv
  }
}

struct Hour: Codable {
  let timeEpoch: Int
  let time: String
  let tempC, tempF: Double
  let isDay: Int
  let condition: RealtimeWeatherCurrentCondition
  let windMph, windKph: Double
  let windDegree: Int
  let windDir: String
  let pressureIn, pressureMb, precipMm, precipIn: Double
  let humidity, cloud: Int
  let feelslikeC, feelslikeF, windchillC, windchillF: Double
  let heatindexC, heatindexF, dewpointC, dewpointF: Double
  let willItRain, chanceOfRain, willItSnow, chanceOfSnow, visKm, visMiles: Int
  let gustMph, gustKph, uv: Double

  enum CodingKeys: String, CodingKey {
    case timeEpoch = "time_epoch"
    case time
    case tempC = "temp_c"
    case tempF = "temp_f"
    case isDay = "is_day"
    case condition
    case windMph = "wind_mph"
    case windKph = "wind_kph"
    case windDegree = "wind_degree"
    case windDir = "wind_dir"
    case pressureMb = "pressure_mb"
    case pressureIn = "pressure_in"
    case precipMm = "precip_mm"
    case precipIn = "precip_in"
    case humidity, cloud
    case feelslikeC = "feelslike_c"
    case feelslikeF = "feelslike_f"
    case windchillC = "windchill_c"
    case windchillF = "windchill_f"
    case heatindexC = "heatindex_c"
    case heatindexF = "heatindex_f"
    case dewpointC = "dewpoint_c"
    case dewpointF = "dewpoint_f"
    case willItRain = "will_it_rain"
    case chanceOfRain = "chance_of_rain"
    case willItSnow = "will_it_snow"
    case chanceOfSnow = "chance_of_snow"
    case visKm = "vis_km"
    case visMiles = "vis_miles"
    case gustMph = "gust_mph"
    case gustKph = "gust_kph"
    case uv
  }
}
