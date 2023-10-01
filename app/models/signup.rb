class Signup < ApplicationRecord
  belongs_to :user, foreign_key: "attendee_id"
  belongs_to :event
end