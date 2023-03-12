# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_customers_on_email  (email) UNIQUE
#
require 'rails_helper'

RSpec.describe Customer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
