# frozen_string_literal: true

FactoryBot.define do
  factory :proposal_item do
    account { Current.account || association(:account) }
    association :proposal_section
    item_code { 'CODE' }
    description { 'Item description' }
    quantity { 1 }
    unit_price { 100 }
    optional { false }
  end
end
