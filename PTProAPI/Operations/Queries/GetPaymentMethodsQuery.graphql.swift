// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetPaymentMethodsQuery: GraphQLQuery {
  public static let operationName: String = "getPaymentMethods"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getPaymentMethods { getPaymentMethods { __typename results { __typename id name processedIn fees currency details isEnable paymentType } status errorMessage } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getPaymentMethods", GetPaymentMethods?.self),
    ] }

    public var getPaymentMethods: GetPaymentMethods? { __data["getPaymentMethods"] }

    /// GetPaymentMethods
    ///
    /// Parent Type: `GetPaymentType`
    public struct GetPaymentMethods: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetPaymentType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetPaymentMethods.Result
      ///
      /// Parent Type: `PaymentMethods`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.PaymentMethods }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("name", String?.self),
          .field("processedIn", String?.self),
          .field("fees", String?.self),
          .field("currency", String?.self),
          .field("details", String?.self),
          .field("isEnable", Bool?.self),
          .field("paymentType", Int?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var name: String? { __data["name"] }
        public var processedIn: String? { __data["processedIn"] }
        public var fees: String? { __data["fees"] }
        public var currency: String? { __data["currency"] }
        public var details: String? { __data["details"] }
        public var isEnable: Bool? { __data["isEnable"] }
        public var paymentType: Int? { __data["paymentType"] }
      }
    }
  }
}
