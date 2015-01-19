class Website < ActiveRecord::Base
  belongs_to :user
  has_many :events

  validates :address, presence: true
  validates :name, presence: true

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end
