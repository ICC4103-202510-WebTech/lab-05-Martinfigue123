class Message < ApplicationRecord
    belongs_to :chat
    belongs_to :sender, class_name: 'User'
    belongs_to :receiver, class_name: 'User'
    validates :content, presence: true
    validates :body, presence: true
    belongs_to :user
end
