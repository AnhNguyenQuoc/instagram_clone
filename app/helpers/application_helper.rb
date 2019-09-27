module ApplicationHelper
  def username_account(email)
    email.gsub(/@.+/, "")
  end
end
