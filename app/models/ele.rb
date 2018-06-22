class Ele < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :created_events, class_name: "Event", foreign_key: :creator_id
  has_and_belongs_to_many :eleattended_events, class_name: "Event"
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
