require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  let(:customer) {
    Customer.create!(
      email: "MyString",
      first_name: "MyString",
      last_name: "MyString"
    )
  }

  before(:each) do
    assign(:customer, customer)
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(customer), "post" do

      assert_select "input[name=?]", "customer[email]"

      assert_select "input[name=?]", "customer[first_name]"

      assert_select "input[name=?]", "customer[last_name]"
    end
  end
end
