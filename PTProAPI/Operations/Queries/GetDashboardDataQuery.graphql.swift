// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetDashboardDataQuery: GraphQLQuery {
    static let operationName: String = "getDashboardData"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getDashboardData", GetDashboardData?.self, arguments: [
          "userId": .variable("userId"),
          "fromDate": .variable("fromDate"),
          "toDate": .variable("toDate"),
          "filter": .variable("filter"),
          "graphType": .variable("graphType")
        ]),
      ] }

      var getDashboardData: GetDashboardData? { __data["getDashboardData"] }

      /// GetDashboardData
      ///
      /// Parent Type: `GetClicksType`
      struct GetDashboardData: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetClicksType }
        static var __selections: [Apollo.Selection] { [
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

        var clickOverviewCount: Int? { __data["clickOverviewCount"] }
        var clickFilterCount: Int? { __data["clickFilterCount"] }
        var conversionOverviewCount: Int? { __data["conversionOverviewCount"] }
        var conversionFilterCount: Int? { __data["conversionFilterCount"] }
        var earningOverviewCount: Double? { __data["earningOverviewCount"] }
        var earningFilterCount: Double? { __data["earningFilterCount"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var filter: String? { __data["filter"] }
        var graphType: String? { __data["graphType"] }
        var graphData: [GraphDatum?]? { __data["graphData"] }

        /// GetDashboardData.GraphDatum
        ///
        /// Parent Type: `GetGraphType`
        struct GraphDatum: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetGraphType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("graphDate", String?.self),
            .field("value", Double?.self),
          ] }

          var graphDate: String? { __data["graphDate"] }
          var value: Double? { __data["value"] }
        }
      }
    }
  }

}