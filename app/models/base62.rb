class Base62 <  ApplicationRecord
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length

  def self.encode(number)
    return ALPHABET.first if number.zero? || number.nil?
    result = ""
    while number > 0
      idx = number % BASE
      char = ALPHABET[idx]
      result.prepend char
      number/=BASE
    end

    result
  end

  def self.decode(string)

  end
end

#Base62.encode(1024)
#Base62.decode("ev")
