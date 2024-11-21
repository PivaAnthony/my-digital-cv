class Types::SignInAttributes < Types::BaseInputObject
  description "Attributes required to sign a new JWT Token for an existent User."

  argument :email, String,
           required: true

  argument :password, String,
           required: true
end
