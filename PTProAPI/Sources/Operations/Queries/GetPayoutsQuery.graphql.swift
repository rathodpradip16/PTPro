// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetPayoutsQuery: GraphQLQuery {
  public static let operationName: String = "getPayouts"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query getPayouts {
        getPayouts {
          __typename
          results {
            __typename
            id
            methodId
            paymentMethod {
              __typename
              id
              name
            }
            userId
            payEmail
            address1
            address2
            city
            default
            state
            country
            zipcode
            currency
            default
            createdAt
            last4Digits
            isVerified
            status
          }
        }
      }
      """
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("getPayouts", GetPayouts?.self),
    ] }

    public var getPayouts: GetPayouts? { __data["getPayouts"] }

    /// GetPayouts
    ///
    /// Parent Type: `PayoutWholeType`
    public struct GetPayouts: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.PayoutWholeType }
      public static var __selections: [Selection] { [
        .field("results", [Result?]?.self),
      ] }

      public var results: [Result?]? { __data["results"] }

      /// GetPayouts.Result
      ///
      /// Parent Type: `Payout`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.Payout }
        public static var __selections: [Selection] { [
          .field("id", Int?.self),
          .field("methodId", Int?.self),
          .field("paymentMethod", PaymentMethod?.self),
          .field("userId", String?.self),
          .field("payEmail", String?.self),
          .field("address1", String?.self),
          .field("address2", String?.self),
          .field("city", String?.self),
          .field("default", Bool?.self),
          .field("state", String?.self),
          .field("country", String?.self),
          .field("zipcode", String?.self),
          .field("currency", String?.self),
          .field("createdAt", String?.self),
          .field("last4Digits", Int?.self),
          .field("isVerified", Bool?.self),
          .field("status", Int?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var methodId: Int? { __data["methodId"] }
        public var paymentMethod: PaymentMethod? { __data["paymentMethod"] }
        public var userId: String? { __data["userId"] }
        public var payEmail: String? { __data["payEmail"] }
        public var address1: String? { __data["address1"] }
        public var address2: String? { __data["address2"] }
        public var city: String? { __data["city"] }
        public var `default`: Bool? { __data["default"] }
        public var state: String? { __data["state"] }
        public var country: String? { __data["country"] }
        public var zipcode: String? { __data["zipcode"] }
        public var currency: String? { __data["currency"] }
        public var createdAt: String? { __data["createdAt"] }
        public var last4Digits: Int? { __data["last4Digits"] }
        public var isVerified: Bool? { __data["isVerified"] }
        public var status: Int? { __data["status"] }

        /// GetPayouts.Result.PaymentMethod
        ///
        /// Parent Type: `PaymentMethods`
        public struct PaymentMethod: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.PaymentMethods }
          public static var __selections: [Selection] { [
            .field("id", Int?.self),
            .field("name", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var name: String? { __data["name"] }
        }
      }
    }
  }
}
