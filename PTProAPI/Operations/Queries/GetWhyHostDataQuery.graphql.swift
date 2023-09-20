// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetWhyHostDataQuery: GraphQLQuery {
    static let operationName: String = "getWhyHostData"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getWhyHostData { getWhyHostData { __typename status errorMessage results { __typename id imageName title buttonLabel } } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getWhyHostData", GetWhyHostData?.self),
      ] }

      var getWhyHostData: GetWhyHostData? { __data["getWhyHostData"] }

      /// GetWhyHostData
      ///
      /// Parent Type: `WhyHostCommonType`
      struct GetWhyHostData: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.WhyHostCommonType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", [Result?]?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: [Result?]? { __data["results"] }

        /// GetWhyHostData.Result
        ///
        /// Parent Type: `WhyHostType`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.WhyHostType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("imageName", String?.self),
            .field("title", String?.self),
            .field("buttonLabel", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var imageName: String? { __data["imageName"] }
          var title: String? { __data["title"] }
          var buttonLabel: String? { __data["buttonLabel"] }
        }
      }
    }
  }

}