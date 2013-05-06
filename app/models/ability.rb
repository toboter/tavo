class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    if user.role? :guest
      can :read, :all
    end

    if user.role? :editor
      can :edit, :all
    end

    # Wenn jemand 'admin' ist soll er nur ein Häckchen bei published (jeder Datensatz) 
    # bzw die Rollenzuweisung und activated bei User machen können.
    if user.role? :admin
      can :administrate, :all
    end
    
    # user ||= User.new # guest user (not logged in)
    # if user.role == 'admin'
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end