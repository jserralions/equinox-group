class RecipePolicy < ApplicationPolicy
  def update?
    user.admin? or record.user == user
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end