class User < ApplicationRecord
    has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
    has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'
    has_many :messages
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    has_many :sent_chats, class_name: "Chat", foreign_key: :sender_id
    has_many :received_chats, class_name: "Chat", foreign_key: :receiver_id
    def chats
        Chat.where(sender_id: id).or(Chat.where(receiver_id: id))
    end
    def name
        "#{first_name} #{last_name}"
    end
end
