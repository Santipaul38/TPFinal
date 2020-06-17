# frozen_string_literal: true

class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new
        if user.id == 1
            can :manage, :all
        end

        if user.admin?  # additional permissions for administrators
            can :manage, Type
        else
            can :show, Ship
            can :show, Map
            can :show, Game
            can :new, Ship
            can :new, Game
            can :new, Map
            can :index, Ship
            can :index, Map
        end
    end
end
