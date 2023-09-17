// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetWhyHostDataQuery: GraphQLQuery {
  public static let operationName: String = "getWhyHostData"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getWhyHostData { getWhyHostData { __typename status errorMessage results { __typename id imageName title buttonLabel } } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getWhyHostData", GetWhyHostData?.self),
    ] }

    public var getWhyHostData: GetWhyHostData? { __data["getWhyHostData"] }

    /// GetWhyHostData
    ///
    /// Parent Type: `WhyHostCommonType`
    public struct GetWhyHostData: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.WhyHostCommonType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("results", [Result?]?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var results: [Result?]? { __data["results"] }

      /// GetWhyHostData.Result
      ///
      /// Parent Type: `WhyHostType`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.WhyHostType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("imageName", String?.self),
          .field("title", String?.self),
          .field("buttonLabel", String?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var imageName: String? { __data["imageName"] }
        public var title: String? { __data["title"] }
        public var buttonLabel: String? { __data["buttonLabel"] }
      }
    }
  }
}
