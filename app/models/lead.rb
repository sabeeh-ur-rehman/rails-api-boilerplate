# frozen_string_literal: true

class Lead < ApplicationRecord
  include AccountScoped

  belongs_to :rep, class_name: 'User'

  validates :project_name, :job_type, :spa_type, :rep, :client_request_date,
            :site_address, :customer_name, :customer_phone, :customer_email,
            :council, presence: true
  validates :customer_no, uniqueness: { scope: :account_id }
  validates :job_no, uniqueness: { scope: :account_id }

  before_validation :assign_numbers, on: :create

  private

  def assign_numbers
    service = Numbers::GenerateService.new(account: account)
    self.customer_no ||= service.next_customer_no
    self.job_no ||= service.next_job_no
  end
end
