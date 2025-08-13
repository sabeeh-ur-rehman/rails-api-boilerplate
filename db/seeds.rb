# frozen_string_literal: true

demo_account = Account.find_or_create_by!(name: 'Demo', subdomain: 'demo')

User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.role = :admin
  user.account = demo_account
end
