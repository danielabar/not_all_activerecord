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

  describe "#save" do
    context "when form is valid" do
      before do
        customer_form.email = "this_is_good@test.com"
        customer_form.first_name = "Fred"
        customer_form.last_name = "Flinstone"
        customer_form.age = 44
      end

      it "creates a new customer" do
        expect { subject.save }.to change(Customer, :count).by(1)
      end

      it "returns true" do
        expect(subject.save).to be_truthy
      end

      it "sets the customer attribute" do
        subject.save
        expect(subject.customer).to be_a(Customer)
      end
    end

    context "when form is invalid" do
      before do
        allow(subject).to receive(:valid?).and_return(false)
      end

      it "does not create a new customer" do
        expect { subject.save }.not_to change(Customer, :count)
      end

      it "returns false" do
        expect(subject.save).to be_falsey
      end

      it "does not set the customer attribute" do
        subject.save
        expect(subject.customer).to be_nil
      end
    end
  end
end
