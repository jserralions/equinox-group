class RecipePolicy < ApplicationPolicy
  def update?
    admin? || owner?
  end

  def edit?
    update?
  end

  def destroy?
    admin? || owner?
  end

  private
    def admin?
      user.present? && user.admin?
    end

    def owner?
      record.user == user
    end
end