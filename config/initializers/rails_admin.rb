RailsAdmin.config do |config|

  ### Popular gems integration
  config.included_models = ['Report', 'Patient', 'Referrer']

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    raise ActionController::RoutingError.new('Not Found') unless current_user.admin?
  end

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      only ['Referrer']
    end
    export do
      only ['Referrer']
    end
    bulk_delete do
      only ['Report']
    end
    show
    edit do
      only ['Referrer']
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
