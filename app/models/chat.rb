class Chat < ApplicationRecord
    belongs_to :sender,  class_name: 'User'
    belongs_to :receiver, class_name: 'User'
    has_many :messages
    validates :sender_id, :receiver_id, presence: true
end
