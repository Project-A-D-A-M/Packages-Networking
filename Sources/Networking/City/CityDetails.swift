import Foundation

public final class CityDetails: Codable {
    public var id: String?
    public var name: String
    public var country: String
    public var state: String
    public var imagesIds: [String]
    public var latitude: Double
    public var longitude: Double
    public var description: String?
    public var attractionsIds: [String]?
    
    public init(id: String? = nil, name: String, country: String, state: String, imagesIds: [String], latitude: Double, longitude: Double, description: String? = nil, attractionsIds: [String]? = nil) {
        self.id = id
        self.name = name
        self.country = country
        self.state = state
        self.imagesIds = imagesIds
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
        self.attractionsIds = attractionsIds
    }
}
