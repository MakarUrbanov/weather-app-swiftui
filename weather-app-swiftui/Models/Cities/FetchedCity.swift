import Foundation

struct FetchedCity: Codable, Identifiable {
  var id: Int
  var name: String
  var region: String
  var country: String
  var lat: Double
  var lon: Double
  var url: String
}
