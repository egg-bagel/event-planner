class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :signups, :dependent => :delete_all
  has_many :attendees, through: :signups, source: :user, :dependent => :delete_all

  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date >= ?", Date.today) }

  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
