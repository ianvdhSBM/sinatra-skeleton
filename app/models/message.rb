class Message < ActiveRecord::Base

  validates :title, 
    presence: true,
    length: { maximum: 50 }

  validates :content,
    presence: true,
    length: { maximum: 200 }

  validates :author,
    presence: true,
    length: { maximum: 30 }



end