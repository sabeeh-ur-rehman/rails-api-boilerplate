# frozen_string_literal: true

class User < ApplicationRecord
  include Authenticable
  include AccountScoped

  enum role: { admin: 0, rep: 1, manager: 2 }
end
