ActiveAdmin.register Doctor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :specialty_id, user_attributes: [:email, :password]
  # belongs_to :specialty
  form do |f|
    f.inputs "New Doctor" do
      # f.label :specialty_id, "Specialty"
      f.input :specialty_id, as: :select, collection: Specialty.all.collect {|x| [x.name, x.id]}
      f.input :name
      f.has_many :user do |creds|
        creds.input :email
        creds.input :password
      end
    end
    f.actions
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :specialty_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
