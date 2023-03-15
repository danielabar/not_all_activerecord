class CustomerForm
  include ActiveModel::Model

  attr_accessor :email, :first_name, :last_name, :age, :id
  attr_reader :customer

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 18 }

  validate :email_available?, if: -> { id.nil? }

  def email_available?
    errors.add(:email, "already taken") if Customer.find_by(email:)
  end

  def save
    return false unless valid?

    @customer = id ? Customer.find(id) : Customer.new
    @customer.email = email
    @customer.first_name = first_name
    @customer.last_name = last_name
    @customer.save
  end
end
