// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateAffiliateUserMutation: GraphQLMutation {
    static let operationName: String = "createAffiliateUser"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation createAffiliateUser($id: String, $email: String!, $password: String, $findUS: String, $phonenumber: String, $countryCode: String) { createAffiliateUser( id: $id email: $email password: $password findUS: $findUS phonenumber: $phonenumber countryCode: $countryCode ) { __typename status errorMessage } }"#
      ))

    public var id: GraphQLNullable<String>
    public var email: String
    public var password: GraphQLNullable<String>
    public var findUS: GraphQLNullable<String>
    public var phonenumber: GraphQLNullable<String>
    public var countryCode: GraphQLNullable<String>

    public init(
      id: GraphQLNullable<String>,
      email: String,
      password: GraphQLNullable<String>,
      findUS: GraphQLNullable<String>,
      phonenumber: GraphQLNullable<String>,
      countryCode: GraphQLNullable<String>
    ) {
      self.id = id
      self.email = email
      self.password = password
      self.findUS = findUS
      self.phonenumber = phonenumber
      self.countryCode = countryCode
    }

    public var __variables: Variables? { [
      "id": id,
      "email": email,
      "password": password,
      "findUS": findUS,
      "phonenumber": phonenumber,
      "countryCode": countryCode
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("createAffiliateUser", CreateAffiliateUser?.self, arguments: [
          "id": .variable("id"),
          "email": .variable("email"),
          "password": .variable("password"),
          "findUS": .variable("findUS"),
          "phonenumber": .variable("phonenumber"),
          "countryCode": .variable("countryCode")
        ]),
      ] }

      var createAffiliateUser: CreateAffiliateUser? { __data["createAffiliateUser"] }

      /// CreateAffiliateUser
      ///
      /// Parent Type: `AffiliateUserType`
      struct CreateAffiliateUser: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateUserType }
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