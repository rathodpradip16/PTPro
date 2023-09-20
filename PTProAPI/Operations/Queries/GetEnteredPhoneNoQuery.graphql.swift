// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class GetEnteredPhoneNoQuery: GraphQLQuery {
  public static let operationName: String = "getEnteredPhoneNo"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query getEnteredPhoneNo { getPhoneData { __typename userId profileId phoneNumber country countryCode verification { __typename id isPhoneVerified } verificationCode status errorMessage } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("getPhoneData", GetPhoneData?.self),
    ] }

    public var getPhoneData: GetPhoneData? { __data["getPhoneData"] }

    /// GetPhoneData
    ///
    /// Parent Type: `UserAccount`
    public struct GetPhoneData: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserAccount }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("userId", PTProAPI.ID?.self),
        .field("profileId", Int?.self),
        .field("phoneNumber", String?.self),
        .field("country", Int?.self),
        .field("countryCode", String?.self),
        .field("verification", Verification?.self),
        .field("verificationCode", Int?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var userId: PTProAPI.ID? { __data["userId"] }
      public var profileId: Int? { __data["profileId"] }
      public var phoneNumber: String? { __data["phoneNumber"] }
      public var country: Int? { __data["country"] }
      public var countryCode: String? { __data["countryCode"] }
      public var verification: Verification? { __data["verification"] }
      public var verificationCode: Int? { __data["verificationCode"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetPhoneData.Verification
      ///
      /// Parent Type: `UserVerifiedInfo`
      public struct Verification: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserVerifiedInfo }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("isPhoneVerified", Bool?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var isPhoneVerified: Bool? { __data["isPhoneVerified"] }
      }
    }
  }
}
