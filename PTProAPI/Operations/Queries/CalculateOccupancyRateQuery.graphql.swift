// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class CalculateOccupancyRateQuery: GraphQLQuery {
  public static let operationName: String = "calculateOccupancyRate"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query calculateOccupancyRate($lat: Float, $lng: Float, $filter: String, $startDate: String, $endDate: String) { calculateOccupancyRate( lat: $lat lng: $lng filter: $filter startDate: $startDate endDate: $endDate ) { __typename Occupancy_Rate filter status errorMessage } }"#
    ))

  public var lat: GraphQLNullable<Double>
  public var lng: GraphQLNullable<Double>
  public var filter: GraphQLNullable<String>
  public var startDate: GraphQLNullable<String>
  public var endDate: GraphQLNullable<String>

  public init(
    lat: GraphQLNullable<Double>,
    lng: GraphQLNullable<Double>,
    filter: GraphQLNullable<String>,
    startDate: GraphQLNullable<String>,
    endDate: GraphQLNullable<String>
  ) {
    self.lat = lat
    self.lng = lng
    self.filter = filter
    self.startDate = startDate
    self.endDate = endDate
  }

  public var __variables: Variables? { [
    "lat": lat,
    "lng": lng,
    "filter": filter,
    "startDate": startDate,
    "endDate": endDate
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("calculateOccupancyRate", CalculateOccupancyRate?.self, arguments: [
        "lat": .variable("lat"),
        "lng": .variable("lng"),
        "filter": .variable("filter"),
        "startDate": .variable("startDate"),
        "endDate": .variable("endDate")
      ]),
    ] }

    public var calculateOccupancyRate: CalculateOccupancyRate? { __data["calculateOccupancyRate"] }

    /// CalculateOccupancyRate
    ///
    /// Parent Type: `CalculateOccupancyRate`
    public struct CalculateOccupancyRate: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.CalculateOccupancyRate }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("Occupancy_Rate", Double?.self),
        .field("filter", String?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var occupancy_Rate: Double? { __data["Occupancy_Rate"] }
      public var filter: String? { __data["filter"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
