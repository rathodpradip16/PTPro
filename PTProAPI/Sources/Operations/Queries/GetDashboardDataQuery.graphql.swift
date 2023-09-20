// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetDashboardDataQuery: GraphQLQuery {
  public static let operationName: String = "getDashboardData"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getDashboardData($userId: String, $fromDate: String, $toDate: String, $filter: String, $graphType: String) { getDashboardData( userId: $userId fromDate: $fromDate toDate: $toDate filter: $filter graphType: $graphType ) { __typename clickOverviewCount clickFilterCount conversionOverviewCount conversionFilterCount earningOverviewCount earningFilterCount status errorMessage filter graphType graphData { __typename graphDate value } } }"#
    ))

  public var userId: GraphQLNullable<String>
  public var fromDate: GraphQLNullable<String>
  public var toDate: GraphQLNullable<String>
  public var filter: GraphQLNullable<String>
  public var graphType: GraphQLNullable<String>

  public init(
    userId: GraphQLNullable<String>,
    fromDate: GraphQLNullable<String>,
    toDate: GraphQLNullable<String>,
    filter: GraphQLNullable<String>,
    graphType: GraphQLNullable<String>
  ) {
    self.userId = userId
    self.fromDate = fromDate
    self.toDate = toDate
    self.filter = filter
    self.graphType = graphType
  }

  public var __variables: Variables? { [
    "userId": userId,
    "fromDate": fromDate,
    "toDate": toDate,
    "filter": filter,
    "graphType": graphType
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getDashboardData", GetDashboardData?.self, arguments: [
        "userId": .variable("userId"),
        "fromDate": .variable("fromDate"),
        "toDate": .variable("toDate"),
        "filter": .variable("filter"),
        "graphType": .variable("graphType")
      ]),
    ] }

    public var getDashboardData: GetDashboardData? { __data["getDashboardData"] }

    /// GetDashboardData
    ///
    /// Parent Type: `GetClicksType`
    public struct GetDashboardData: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.GetClicksType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("clickOverviewCount", Int?.self),
        .field("clickFilterCount", Int?.self),
        .field("conversionOverviewCount", Int?.self),
        .field("conversionFilterCount", Int?.self),
        .field("earningOverviewCount", Double?.self),
        .field("earningFilterCount", Double?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("filter", String?.self),
        .field("graphType", String?.self),
        .field("graphData", [GraphDatum?]?.self),
      ] }

      public var clickOverviewCount: Int? { __data["clickOverviewCount"] }
      public var clickFilterCount: Int? { __data["clickFilterCount"] }
      public var conversionOverviewCount: Int? { __data["conversionOverviewCount"] }
      public var conversionFilterCount: Int? { __data["conversionFilterCount"] }
      public var earningOverviewCount: Double? { __data["earningOverviewCount"] }
      public var earningFilterCount: Double? { __data["earningFilterCount"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var filter: String? { __data["filter"] }
      public var graphType: String? { __data["graphType"] }
      public var graphData: [GraphDatum?]? { __data["graphData"] }

      /// GetDashboardData.GraphDatum
      ///
      /// Parent Type: `GetGraphType`
      public struct GraphDatum: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.GetGraphType }
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
