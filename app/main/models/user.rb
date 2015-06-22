# By default Volt generates this User model which inherits from Volt::User,
# you can rename this if you want.
class User < Volt::User
  has_many :players
  # login_field is set to :email by default and can be changed to :username
  # in config/app.rb
  field login_field
  field :name
  field :email
  field :admin

  permissions(:update) do
    deny :admin
  end

  validate login_field, unique: true#, length: 8
  validate :email, email: true

end
