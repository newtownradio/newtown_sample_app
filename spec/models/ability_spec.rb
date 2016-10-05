require 'rails_helper'

describe Ability, :type => :model do

    def initialize(user)
    user || = User.new
    can :manage, User, id: user.id
    if user.admin?
    can :manage, :all
    else
    can :manage, User, id:, user.end
    end
  end
end

