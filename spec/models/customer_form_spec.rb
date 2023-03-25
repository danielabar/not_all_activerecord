require "rails_helper"

RSpec.describe CustomerForm, type: :model do
  subject(:customer_form) { described_class.new }

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should allow_value("email@example.com").for(:email) }
    it { should_not allow_value("email").for(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:age) }
    it { should validate_numericality_of(:age).only_integer.is_greater_than(18) }

    context "when email is already taken" do
      let!(:customer) { create(:customer, email: "email@example.com") }

      before { customer_form.email = "email@example.com" }

      it { should_not be_valid }
      it "has an error on email" do
        customer_form.valid?
        expect(customer_form.errors[:email]).to include("already taken")
      end
    end
  end
end
