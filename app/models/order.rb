class Order < ActiveRecord::Base

  validates :first_name,
            :presence => true

  validates :last_name,
            :presence => true

  validates :quantity,
            :numericality => {:greater_than => 0}

  belongs_to :event
end
