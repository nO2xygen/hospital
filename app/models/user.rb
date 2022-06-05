class User < ApplicationRecord
    devise :database_authenticatable,
      :validatable,
      :jwt_authenticatable,
      :registerable,
      jwt_revocation_strategy: JwtDenylist
  
    belongs_to :role, polymorphic: true 
end