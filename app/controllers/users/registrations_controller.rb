# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    private
  
    def respond_with(resource, _opts = {})
      resource.persisted? ? register_success : register_failed
    end
  
    def register_success
      render json: {
        message: 'Signed Up!',
        user: current_user
      }, status: :ok
    end
  
    def register_failed
      render json: { message: 'Sign Up Failure!' }, status: :unprocessable_entity
    end
end
  