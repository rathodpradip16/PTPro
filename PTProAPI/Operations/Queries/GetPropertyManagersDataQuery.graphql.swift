// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetPropertyManagersDataQuery: GraphQLQuery {
    static let operationName: String = "getPropertyManagersData"
    static let operationDocument: Apollo.OperationDocument = .init(
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getPropertyManagersData", GetPropertyManagersData?.self, arguments: [
          "userId": .variable("userId"),
          "filter": .variable("filter"),
          "graphType": .variable("graphType"),
          "startDate": .variable("startDate"),
          "endDate": .variable("endDate")
        ]),
      ] }

      var getPropertyManagersData: GetPropertyManagersData? { __data["getPropertyManagersData"] }

      /// GetPropertyManagersData
      ///
      /// Parent Type: `GetClicks`
      struct GetPropertyManagersData: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetClicks }
        static var __selections: [Apollo.Selection] { [
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

        var inquiry_to_Booking_Conversion_Rate: Int? { __data["Inquiry_to_Booking_Conversion_Rate"] }
        var occupancy_Rate: Double? { __data["Occupancy_Rate"] }
        var average_Daily_Rate: Double? { __data["Average_Daily_Rate"] }
        var revPAR: Double? { __data["RevPAR"] }
        var total1: Double? { __data["total1"] }
        var total2: Double? { __data["total2"] }
        var rate: Double? { __data["rate"] }
        var filter: String? { __data["filter"] }
        var graphType: String? { __data["graphType"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var graphData: GraphData? { __data["graphData"] }

        /// GetPropertyManagersData.GraphData
        ///
        /// Parent Type: `GetData`
        struct GraphData: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetData }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("data1", [Data1?]?.self),
            .field("data2", [Data2?]?.self),
          ] }

          var data1: [Data1?]? { __data["data1"] }
          var data2: [Data2?]? { __data["data2"] }

          /// GetPropertyManagersData.GraphData.Data1
          ///
          /// Parent Type: `GetGraph`
          struct Data1: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetGraph }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("graphDate", String?.self),
              .field("value", Double?.self),
            ] }

            var graphDate: String? { __data["graphDate"] }
            var value: Double? { __data["value"] }
          }

          /// GetPropertyManagersData.GraphData.Data2
          ///
          /// Parent Type: `GetGraph`
          struct Data2: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetGraph }
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

}