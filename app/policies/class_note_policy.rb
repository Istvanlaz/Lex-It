class ClassNotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def my_notes?
    true
  end
end
