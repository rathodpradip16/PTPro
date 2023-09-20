// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetEnteredPhoneNoQuery: GraphQLQuery {
    static let operationName: String = "getEnteredPhoneNo"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getEnteredPhoneNo { getPhoneData { __typename userId profileId phoneNumber country countryCode verification { __typename id isPhoneVerified } verificationCode status errorMessage } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getPhoneData", GetPhoneData?.self),
      ] }

      var getPhoneData: GetPhoneData? { __data["getPhoneData"] }

      /// GetPhoneData
      ///
      /// Parent Type: `UserAccount`
      struct GetPhoneData: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserAccount }
        static var __selections: [Apollo.Selection] { [
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

        var userId: PTProAPI.ID? { __data["userId"] }
        var profileId: Int? { __data["profileId"] }
        var phoneNumber: String? { __data["phoneNumber"] }
        var country: Int? { __data["country"] }
        var countryCode: String? { __data["countryCode"] }
        var verification: Verification? { __data["verification"] }
        var verificationCode: Int? { __data["verificationCode"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetPhoneData.Verification
        ///
        /// Parent Type: `UserVerifiedInfo`
        struct Verification: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserVerifiedInfo }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("isPhoneVerified", Bool?.self),
          ] }

          var id: Int? { __data["id"] }
          var isPhoneVerified: Bool? { __data["isPhoneVerified"] }
        }
      }
    }
  }

}