# frozen_string_literal: true

FactoryBot.define do
  factory :proposal_section do
    account { Current.account || association(:account) }
    association :proposal
    title { 'Section' }
    position { 1 }
  end
end
