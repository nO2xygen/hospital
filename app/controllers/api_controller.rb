class ApiController < ActionController::API
end
# class BaseController < ActionController::Metal
#     abstract!
  
#     # Order of modules is important
#     # See: https://github.com/rails/rails/blob/v7.0.2.3/actionpack/lib/action_controller/base.rb#L205
#     MODULES = [
#       AbstractController::Rendering,
  
#       # Extra modules #################
  
#       ActionController::Helpers,
#       ActionView::Layouts,
#       ActionController::MimeResponds,
#       ActionController::Flash,
      
#       #################################
  
#       ActionController::UrlFor,
#       ActionController::Redirecting,
#       ActionController::ApiRendering,
#       ActionController::Renderers::All,
#       ActionController::ConditionalGet,
#       ActionController::BasicImplicitRender,
#       ActionController::StrongParameters,
  
#       ActionController::DataStreaming,
#       ActionController::DefaultHeaders,
#       ActionController::Logging,
  
#       # Before callbacks should also be executed as early as possible, so
#       # also include them at the bottom.
#       AbstractController::Callbacks,
  
#       # Append rescue at the bottom to wrap as much as possible.
#       ActionController::Rescue,
  
#       # Add instrumentations hooks at the bottom, to ensure they instrument
#       # all the methods properly.
#       ActionController::Instrumentation,
  
#       # Params wrapper should come before instrumentation so they are
#       # properly showed in logs
#       ActionController::ParamsWrapper
#     ]
  
#     MODULES.each do |mod|
#       include mod
#     end
  
#     ActiveSupport.run_load_hooks(:action_controller_api, self)
#     ActiveSupport.run_load_hooks(:action_controller, self)
# end
