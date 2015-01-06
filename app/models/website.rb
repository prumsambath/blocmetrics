class Website < ActiveRecord::Base
  belongs_to :user

  validates :address, presence: true
  validates :name, presence: true

  scope :user_websites, -> (user) { where("user_id = ?", user.id) }

  after_save :generate_token

  private

  def generate_token
    self.token = "abcde"
  end
end
