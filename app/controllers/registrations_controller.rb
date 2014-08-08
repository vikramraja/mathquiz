class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      assignments_path(resource)
    end
end