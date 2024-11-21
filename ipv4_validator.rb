module IPv4Validator
  def self.valid_ipv4_address?(ip)
    parts = ip.split('.')
    return false unless parts.size == 4

    parts.all? do |part|
      part.match?(/^\d+$/) && part.to_i.between?(0, 255) && part == part.to_i.to_s
    end
  end
end

if __FILE__ == $0
  # Запит адреси
  print "Введіть IPv4-адресу: "
  ip_address = gets.chomp # Отримати введену  адресу
  result = IPv4Validator.valid_ipv4_address?(ip_address)
  puts result ? "true" : "false" # Вивід
end
