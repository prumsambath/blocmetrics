class Website < ActiveRecord::Base
  belongs_to :user
  has_many :events

  validates :address, presence: true
  validates :name, presence: true

  before_create :generate_token

  def to_csv
    CSV.generate do |csv|
      csv << Event.column_names
      self.events.each do |event|
        csv << event.attributes.values_at(*Event.column_names)
      end
    end
  end

  private

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end
