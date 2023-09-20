// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class SocialLoginVerifyMutation: GraphQLMutation {
    static let operationName: String = "SocialLoginVerify"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation SocialLoginVerify($verificationType: String!, $actionType: String!) { SocialVerification(verificationType: $verificationType, actionType: $actionType) { __typename status errorMessage } }"#
      ))

    public var verificationType: String
    public var actionType: String

    public init(
      verificationType: String,
      actionType: String
    ) {
      self.verificationType = verificationType
      self.actionType = actionType
    }

    public var __variables: Variables? { [
      "verificationType": verificationType,
      "actionType": actionType
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("SocialVerification", SocialVerification?.self, arguments: [
          "verificationType": .variable("verificationType"),
          "actionType": .variable("actionType")
        ]),
      ] }

      var socialVerification: SocialVerification? { __data["SocialVerification"] }

      /// SocialVerification
      ///
      /// Parent Type: `SocialVerification`
      struct SocialVerification: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SocialVerification }
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