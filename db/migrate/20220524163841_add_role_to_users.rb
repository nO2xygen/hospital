class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role, polymorphic: true, index: true
  end
end
