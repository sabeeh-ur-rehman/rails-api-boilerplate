# frozen_string_literal: true

FactoryBot.define do
  factory :lead do
    account { Current.account || association(:account) }
    association :rep, factory: :user, account: account
    project_name { 'Test Project' }
    job_type { 'installation' }
    spa_type { 'standard' }
    vanishing_edge { false }
    client_request_date { Date.today }
    site_address { '123 Street' }
    customer_name { 'John Doe' }
    customer_phone { '1234567890' }
    customer_email { 'john@example.com' }
    council { 'City Council' }
  end
end
