
# Валідатор IPv4

Цей проєкт надає простий Ruby-модуль для перевірки валідності IPv4-адрес. Він перевіряє, чи є заданий рядок коректною IPv4-адресою у канонічному форматі (чотири числа від 0 до 255, розділені крапками, без ведучих нулів чи некоректних символів).

## Можливості
- Перевірка IPv4-адрес за допомогою модуля `IPv4Validator`.
- Підтримка інтерактивного введення через термінал.
- Включає набір тестів для перевірки коректності роботи.

## Як використовувати

1. Клонуйте репозиторій або скопіюйте файли.
2. Запустіть файл `ipv4_validator.rb` у інтерактивному режимі:
   ```bash
   ruby ipv4_validator.rb
   ```
   - Програма запропонує ввести IPv4-адресу.
   - Вона поверне `true`, якщо адреса валідна, або `false` в іншому випадку.

## Приклад
```bash
$ ruby ipv4_validator.rb
Введіть IPv4-адресу: 192.168.1.1
true

$ ruby ipv4_validator.rb
Введіть IPv4-адресу: 256.256.256.256
false
```

## Структура файлів

### `ipv4_validator.rb`
- Містить модуль `IPv4Validator` із методом `valid_ipv4_address?`.
- Якщо файл запускається напряму, він запитує IPv4-адресу у користувача та перевіряє її.

### `test_ipv4_validator.rb`
- Містить набір юніт-тестів для модуля `IPv4Validator`, використовуючи `minitest`.
- Для запуску тестів:
  ```bash
  ruby test_ipv4_validator.rb
  ```

## Тестування
Щоб перевірити функціональність валідатора, запустіть вбудований тестовий набір:
```bash
ruby test_ipv4_validator.rb
```

### Приклад результату тестів
```
Run options: --seed 12345

# Running:

..

Finished in 0.001234s, 1620.2436 runs/s, 3240.4872 assertions/s.

2 runs, 16 assertions, 0 failures, 0 errors, 0 skips
```

## Вимоги
- Ruby 2.5 або пізніша версія.
- Гем `minitest` (входить у стандартну бібліотеку Ruby).

## Огляд коду

### Логіка перевірки IPv4
```ruby
module IPv4Validator
  def self.valid_ipv4_address?(ip)
    parts = ip.split('.')
    return false unless parts.size == 4

    parts.all? do |part|
      part.match?(/^\d+$/) && part.to_i.between?(0, 255) && part == part.to_i.to_s
    end
  end
end
```

### Приклади тестів
```ruby
require 'minitest/autorun'
require_relative 'ipv4_validator'

class TestValidIPv4Address < Minitest::Test
  def test_valid_addresses
    assert_equal true, IPv4Validator.valid_ipv4_address?("192.168.1.1")
    assert_equal true, IPv4Validator.valid_ipv4_address?("8.8.8.8")
  end

  def test_invalid_addresses
    assert_equal false, IPv4Validator.valid_ipv4_address?("256.256.256.256")
    assert_equal false, IPv4Validator.valid_ipv4_address?("192.168.01.1")
  end
end
```
## Автор
Горбачов Роман
