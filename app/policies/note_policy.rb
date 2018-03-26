class NotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # raise Pundit::NotAuthorizedError unless user.role
      if user.user?
        user.readable
      else
        scope.all
      end
    end
  end

  def show?
    user.admin? || user == record.try(:user)
  end

  def edit?
    user == record.try(:user)
  end

  def destroy?
    user == record.try(:user)
  end
end
