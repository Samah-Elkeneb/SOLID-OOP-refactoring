require_relative 'logger_interface'

class FileLogger < LoggerInterface

  def log(user, total)
    File.open("invoice_log.txt", "a") do |f|
      f.puts "User: #{user.name}, Total: #{total}"
    end
  end

end