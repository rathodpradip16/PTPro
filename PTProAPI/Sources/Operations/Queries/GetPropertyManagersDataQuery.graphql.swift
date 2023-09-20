// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetPropertyManagersDataQuery: GraphQLQuery {
  public static let operationName: String = "getPropertyManagersData"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getPropertyManagersData($userId: String, $filter: String, $graphType: String, $startDate: String, $endDate: String) { getPropertyManagersData( userId: $userId filter: $filter graphType: $graphType startDate: $startDate endDate: $endDate ) { __typename Inquiry_to_Booking_Conversion_Rate Occupancy_Rate Average_Daily_Rate RevPAR total1 total2 rate filter graphType status errorMessage graphData { __typename data1 { __typename graphDate value } data2 { __typename graphDate value } } } }"#
    ))

  public var userId: GraphQLNullable<String>
  public var filter: GraphQLNullable<String>
  public var graphType: GraphQLNullable<String>
  public var startDate: GraphQLNullable<String>
  public var endDate: GraphQLNullable<String>

  public init(
    userId: GraphQLNullable<String>,
    filter: GraphQLNullable<String>,
    graphType: GraphQLNullable<String>,
    startDate: GraphQLNullable<String>,
    endDate: GraphQLNullable<String>
  ) {
    self.userId = userId
    self.filter = filter
    self.graphType = graphType
    self.startDate = startDate
    self.endDate = endDate
  }

  public var __variables: Variables? { [
    "userId": userId,
    "filter": filter,
    "graphType": graphType,
    "startDate": startDate,
    "endDate": endDate
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getPropertyManagersData", GetPropertyManagersData?.self, arguments: [
        "userId": .variable("userId"),
        "filter": .variable("filter"),
        "graphType": .variable("graphType"),
        "startDate": .variable("startDate"),
        "endDate": .variable("endDate")
      ]),
    ] }

    public var getPropertyManagersData: GetPropertyManagersData? { __data["getPropertyManagersData"] }

    /// GetPropertyManagersData
    ///
    /// Parent Type: `GetClicks`
    public struct GetPropertyManagersData: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.GetClicks }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("Inquiry_to_Booking_Conversion_Rate", Int?.self),
        .field("Occupancy_Rate", Double?.self),
        .field("Average_Daily_Rate", Double?.self),
        .field("RevPAR", Double?.self),
        .field("total1", Double?.self),
        .field("total2", Double?.self),
        .field("rate", Double?.self),
        .field("filter", String?.self),
        .field("graphType", String?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("graphData", GraphData?.self),
      ] }

      public var inquiry_to_Booking_Conversion_Rate: Int? { __data["Inquiry_to_Booking_Conversion_Rate"] }
      public var occupancy_Rate: Double? { __data["Occupancy_Rate"] }
      public var average_Daily_Rate: Double? { __data["Average_Daily_Rate"] }
      public var revPAR: Double? { __data["RevPAR"] }
      public var total1: Double? { __data["total1"] }
      public var total2: Double? { __data["total2"] }
      public var rate: Double? { __data["rate"] }
      public var filter: String? { __data["filter"] }
      public var graphType: String? { __data["graphType"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var graphData: GraphData? { __data["graphData"] }

      /// GetPropertyManagersData.GraphData
      ///
      /// Parent Type: `GetData`
      public struct GraphData: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.GetData }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("data1", [Data1?]?.self),
          .field("data2", [Data2?]?.self),
        ] }

        public var data1: [Data1?]? { __data["data1"] }
        public var data2: [Data2?]? { __data["data2"] }

        /// GetPropertyManagersData.GraphData.Data1
        ///
        /// Parent Type: `GetGraph`
        public struct Data1: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.GetGraph }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("graphDate", String?.self),
            .field("value", Double?.self),
          ] }

          public var graphDate: String? { __data["graphDate"] }
          public var value: Double? { __data["value"] }
        }

        /// GetPropertyManagersData.GraphData.Data2
        ///
        /// Parent Type: `GetGraph`
        public struct Data2: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.GetGraph }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("graphDate", String?.self),
            .field("value", Double?.self),
          ] }

          public var graphDate: String? { __data["graphDate"] }
          public var value: Double? { __data["value"] }
        }
      }
    }
  }
}
