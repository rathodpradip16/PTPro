// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class LogoutMutation: GraphQLMutation {
    static let operationName: String = "Logout"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation Logout($deviceType: String!, $deviceId: String!) { userLogout(deviceType: $deviceType, deviceId: $deviceId) { __typename status errorMessage } }"#
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("userLogout", UserLogout?.self, arguments: [
          "deviceType": .variable("deviceType"),
          "deviceId": .variable("deviceId")
        ]),
      ] }

      var userLogout: UserLogout? { __data["userLogout"] }

      /// UserLogout
      ///
      /// Parent Type: `UserType`
      struct UserLogout: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
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