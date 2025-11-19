require_relative 'notifier_interface'

class EmailNotifier < NotifierInterface

  def send_notification(user)
    puts "Email sent to #{user.email}: thanks for your purchase"
  end

end