RailsAdmin.config do |config|

  ### Popular gems integration
  config.included_models = ['Report', 'Patient', 'Doctor']

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # config.authorize_with do
  #   redirect_to main_app.authenticated_root_path unless current_user.admin?
  # end

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      only ['Doctor']
    end
    export do
      only ['Doctor']
    end
    bulk_delete do
      only ['Report']
    end
    show
    edit do
      only ['Doctor']
    end
    delete do
      only ['Report']
    end
    # show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
