class Event < ActiveRecord::Base

  validates :event_location_id,
            :presence => true

  validates :name,
            :presence => true

  validates :ticket_price,
            :numericality => {:greater_than => 0}

  belongs_to :event_location
  has_many :orders, :dependent => :destroy
end
