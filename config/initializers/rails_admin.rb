RailsAdmin.config do |config|
  config.authorize_with do 
    redirect_to root_path unless current_user.try(:admin?)
  end
  config.model Comic do
    edit do
      fields_of_type :text do
        ckeditor do 
          true
        end
      end
    end
  end
end