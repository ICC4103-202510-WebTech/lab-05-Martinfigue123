class Message < ApplicationRecord
    belongs_to :chat
    belongs_to :sender, class_name: 'User', foreign_key: :sender_id
    belongs_to :receiver, class_name: 'User'
    validates :body, presence: true
    validates :body, presence: true
    belongs_to :user
end
