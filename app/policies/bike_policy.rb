class BikePolicy < ApplicationPolicy

    class Scope < Scope
        def resolve
            user.admin? ? scope.all : scope.where(user_id: user.id)
        end
    end


end