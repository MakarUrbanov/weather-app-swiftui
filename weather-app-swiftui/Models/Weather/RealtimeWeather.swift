import Foundation

struct LocationStruct: Codable {
  let name, region, country: String
  let lat, lon: Double
  let tzId: String
  let localtimeEpoch: Int
  let localtime: String

  enum CodingKeys: String, CodingKey {
    case name, region, country, lat, lon
    case tzId = "tz_id"
    case localtimeEpoch = "localtime_epoch"
    case localtime
  }
}

struct ConditionStruct: Codable {
  let text: String
  let icon: String
  let code: Int
}

struct CurrentStruct: Codable {
  let lastUpdatedEpoch: Int
  let lastUpdated: String
  let tempC, isDay: Double
  let tempF: Double
  let condition: ConditionStruct
  let windMph, windKph: Double
  let windDegree: Int
  let windDir: String
  let pressureMb, pressureIn: Double
  let precipMm, precipIn: Double
  let humidity, cloud: Int
  let feelslikeC, feelslikeF: Double
  let visKm, visMiles, uv, gustMph, gustKph: Double

  enum CodingKeys: String, CodingKey {
    case lastUpdatedEpoch = "last_updated_epoch"
    case lastUpdated = "last_updated"
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
    case visKm = "vis_km"
    case visMiles = "vis_miles"
    case uv
    case gustMph = "gust_mph"
    case gustKph = "gust_kph"
  }
}

struct RealtimeWeatherStruct: Codable {
  let location: LocationStruct
  let current: CurrentStruct?
}
