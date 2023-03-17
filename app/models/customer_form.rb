class CustomerForm
  include ActiveModel::Model

  attr_accessor :email, :first_name, :last_name, :age
  attr_reader :customer

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 18 }

  validate :email_available?

  def email_available?
    errors.add(:email, "already taken") if Customer.find_by(email:)
  end

  # TODO: what if we're editing the email address?
  # Maybe this should only be for creating new customer, and add update method for edits
  def save
    return false unless valid?

    @customer = Customer.find_or_initialize_by(email:)
    @customer.first_name = first_name
    @customer.last_name = last_name
    @customer.save
  end
end
