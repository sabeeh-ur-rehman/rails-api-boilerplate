# frozen_string_literal: true

FactoryBot.define do
  factory :proposal do
    account { Current.account || association(:account) }
    association :lead, account: account
    issue_number { 1 }
    status { 'draft' }
    adjustment_type { 'none' }
    adjustment_percentage { 0 }
  end
end
