require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        email: "Email",
        first_name: "First Name",
        last_name: "Last Name"
      ),
      Customer.create!(
        email: "Email",
        first_name: "First Name",
        last_name: "Last Name"
      )
    ])
  end

  it "renders a list of customers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
  end
end
