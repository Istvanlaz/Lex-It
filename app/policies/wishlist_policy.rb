class WishlistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.find_by(user: user)
    end
  end
end
