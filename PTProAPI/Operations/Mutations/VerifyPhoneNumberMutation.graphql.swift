// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class VerifyPhoneNumberMutation: GraphQLMutation {
    static let operationName: String = "VerifyPhoneNumber"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation VerifyPhoneNumber($verificationCode: Int!) { VerifyPhoneNumber(verificationCode: $verificationCode) { __typename status errorMessage } }"#
      ))

    public var verificationCode: Int

    public init(verificationCode: Int) {
      self.verificationCode = verificationCode
    }

    public var __variables: Variables? { ["verificationCode": verificationCode] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("VerifyPhoneNumber", VerifyPhoneNumber?.self, arguments: ["verificationCode": .variable("verificationCode")]),
      ] }

      var verifyPhoneNumber: VerifyPhoneNumber? { __data["VerifyPhoneNumber"] }

      /// VerifyPhoneNumber
      ///
      /// Parent Type: `UserAccount`
      struct VerifyPhoneNumber: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserAccount }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}