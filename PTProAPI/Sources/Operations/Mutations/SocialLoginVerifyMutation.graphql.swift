// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SocialLoginVerifyMutation: GraphQLMutation {
  public static let operationName: String = "SocialLoginVerify"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation SocialLoginVerify($verificationType: String!, $actionType: String!) {
        SocialVerification(verificationType: $verificationType, actionType: $actionType) {
          __typename
          status
          errorMessage
        }
      }
      """
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("SocialVerification", SocialVerification?.self, arguments: [
        "verificationType": .variable("verificationType"),
        "actionType": .variable("actionType")
      ]),
    ] }

    public var socialVerification: SocialVerification? { __data["SocialVerification"] }

    /// SocialVerification
    ///
    /// Parent Type: `SocialVerification`
    public struct SocialVerification: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.SocialVerification }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
