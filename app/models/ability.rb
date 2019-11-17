# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    # 
      # user ||= User.new # guest user (not logged in)
      # if user.admin?
      #   can :manage, :all
      # else
      #   can :read, :all
      # end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    alias_action :create, :read, :update, :delete, to: :crud
    alias_action :create, :read, :update, to: :cru
    alias_action  :read, :update, to: :ru
    # alias_action :show, :to => :show
    # if user.role===2 #ADMIN
    #   can :manage, :all
    # end
    # if user.role===1 #ADMIN
    #   can :read, :all
    # end

  
    # if user.role===1 #ADMIN
    #   can :read, :all
    
      

    if user.present?  # additional permissions for students
      can :show, :update,:edit_password,:update_password, User, id: user.id 
      if user.role===2  # additional permissions for administrators
        can :manage, :all
      elsif user.role===1# additional permissions for teachers
        can :read, :all
        can :update,:edit_password,:update_password, User, id: user.id
      end
    end

    can :crud, Block do |block|
      block.user == user
    end

    can :crud, Cohort do |cohort|
      block.user == user
    end

    # can :ru, User do |u|
    #   u.role ==0 && u.id==user.id#|| answer.question.user == user
    # end
  end
end
