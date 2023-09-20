// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CalculateOccupancyRateQuery: GraphQLQuery {
    static let operationName: String = "calculateOccupancyRate"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("calculateOccupancyRate", CalculateOccupancyRate?.self, arguments: [
          "lat": .variable("lat"),
          "lng": .variable("lng"),
          "filter": .variable("filter"),
          "startDate": .variable("startDate"),
          "endDate": .variable("endDate")
        ]),
      ] }

      var calculateOccupancyRate: CalculateOccupancyRate? { __data["calculateOccupancyRate"] }

      /// CalculateOccupancyRate
      ///
      /// Parent Type: `CalculateOccupancyRate`
      struct CalculateOccupancyRate: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.CalculateOccupancyRate }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("Occupancy_Rate", Double?.self),
          .field("filter", String?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var occupancy_Rate: Double? { __data["Occupancy_Rate"] }
        var filter: String? { __data["filter"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}