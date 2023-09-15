// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LogoutMutation: GraphQLMutation {
  public static let operationName: String = "Logout"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation Logout($deviceType: String!, $deviceId: String!) {
        userLogout(deviceType: $deviceType, deviceId: $deviceId) {
          __typename
          status
          errorMessage
        }
      }
      """
    ))

  public var deviceType: String
  public var deviceId: String

  public init(
    deviceType: String,
    deviceId: String
  ) {
    self.deviceType = deviceType
    self.deviceId = deviceId
  }

  public var __variables: Variables? { [
    "deviceType": deviceType,
    "deviceId": deviceId
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("userLogout", UserLogout?.self, arguments: [
        "deviceType": .variable("deviceType"),
        "deviceId": .variable("deviceId")
      ]),
    ] }

    public var userLogout: UserLogout? { __data["userLogout"] }

    /// UserLogout
    ///
    /// Parent Type: `UserType`
    public struct UserLogout: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.UserType }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
