class ClassNotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def my_notes?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def edit?
    true
  end

  def new?
    true
  end

  def show?
    true
  end
end
