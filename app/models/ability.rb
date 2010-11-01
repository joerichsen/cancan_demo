class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can [:read, :create], Product
      can :manage, Product, :user_id => user.id
      can :manage, Product, :company => { :user_id => user.id }
      can :destroy, Product, :user_id => user.id, :active => false
      can :manage, Product do |product|
        product.user == user && product.editable?
      end
      can :blowup, :cars
      can :manage, :all
    else
      can :read, Product
    end
  end
end
