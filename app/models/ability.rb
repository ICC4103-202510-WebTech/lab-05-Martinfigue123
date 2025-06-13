class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    can :read, Chat, sender_id: user.id
    can :read, Chat, receiver_id: user.id

    can :create, Chat
    can :read, Message do |message|
      message.chat.sender_id == user.id || message.chat.receiver_id == user.id
    end
    can :create, Message do |message|
      message.chat.sender_id == user.id || message.chat.receiver_id == user.id
    end

    can :read, User, id: user.id
    can :manage, User if user.admin?

  end
end
