// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class EditProfileMutation: GraphQLMutation {
    static let operationName: String = "EditProfile"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation EditProfile($userId: String!, $fieldName: String!, $fieldValue: String, $deviceType: String!, $deviceId: String!) { userUpdate( userId: $userId fieldName: $fieldName fieldValue: $fieldValue deviceType: $deviceType deviceId: $deviceId ) { __typename status errorMessage userToken } }"#
      ))

    public var userId: String
    public var fieldName: String
    public var fieldValue: GraphQLNullable<String>
    public var deviceType: String
    public var deviceId: String

    public init(
      userId: String,
      fieldName: String,
      fieldValue: GraphQLNullable<String>,
      deviceType: String,
      deviceId: String
    ) {
      self.userId = userId
      self.fieldName = fieldName
      self.fieldValue = fieldValue
      self.deviceType = deviceType
      self.deviceId = deviceId
    }

    public var __variables: Variables? { [
      "userId": userId,
      "fieldName": fieldName,
      "fieldValue": fieldValue,
      "deviceType": deviceType,
      "deviceId": deviceId
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("userUpdate", UserUpdate?.self, arguments: [
          "userId": .variable("userId"),
          "fieldName": .variable("fieldName"),
          "fieldValue": .variable("fieldValue"),
          "deviceType": .variable("deviceType"),
          "deviceId": .variable("deviceId")
        ]),
      ] }

      var userUpdate: UserUpdate? { __data["userUpdate"] }

      /// UserUpdate
      ///
      /// Parent Type: `UserType`
      struct UserUpdate: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("userToken", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var userToken: String? { __data["userToken"] }
      }
    }
  }

}