class Website < ActiveRecord::Base
  belongs_to :user

  validates :address, presence: true
  validates :name, presence: true
end
