class Event < ActiveRecord::Base
  serialize :meta, Hash
end
