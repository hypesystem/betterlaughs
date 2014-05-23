class AddUsernameEmailConfirmedToBetaSignup < ActiveRecord::Migration
  def up
    add_column :beta_signups, :username, :string
    add_column :beta_signups, :email, :string
    add_column :beta_signups, :confirmed, :boolean, default: false
  end

  def down
    remove_column :beta_signups, :username
    remove_column :beta_signups, :email
    remove_column :beta_signups, :confirmed
  end
end
