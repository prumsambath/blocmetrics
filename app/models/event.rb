class Event < ActiveRecord::Base
  belongs_to :website
  serialize :meta, Hash
end
