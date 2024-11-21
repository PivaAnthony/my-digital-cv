class Types::SignUpAttributes < Types::BaseInputObject
  description "Attributes required to create a new User."

  argument :name, String,
           required: true

  argument :surname, String,
           required: true

  argument :email, String,
           required: true

  argument :password, String,
           required: true
end
