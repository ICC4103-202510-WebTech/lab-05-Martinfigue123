class Chat < ApplicationRecord
    belongs_to :sender,  class_name: 'User'
    belongs_to :receiver, class_name: 'User'
    has_many :messages, dependent: :destroy

    scope :involving, ->(user) {
        where("chats.sender_id = ? OR chats.receiver_id = ?", user.id, user.id)}

    def other_user(user)
        user == sender_id ? receiver : sender
    end
    validates :sender_id, :receiver_id, presence: true
end
