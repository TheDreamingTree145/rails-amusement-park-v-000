module UsersHelper

  def my_attributes(user)
    user.attributes.each do |k, v|
      if k != "password_digest" && k != "name" && k != "admin" && k != "id"
        "#{k}: #{v}"
      end
    end
  end

  def show_admin(user)
    if user.admin
      "ADMIN"
    end
  end

end
