class User < ApplicationRecord
  devise :database_authenticatable,
    :validatable,
    :jwt_authenticatable,
    :registerable,
    jwt_revocation_strategy: JwtDenylist
  self.skip_session_storage = [:http_auth, :params_auth]
  
  belongs_to :role, polymorphic: true 
end