class EventLocation < ActiveRecord::Base

  validates :name,
            :presence => true

  validates :available_seats,
            :numericality => {:greater_than => 0}

  has_many :events, :dependent => :destroy
end
