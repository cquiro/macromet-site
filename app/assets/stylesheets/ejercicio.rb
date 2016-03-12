# # ejercicio.rb

# # Iteracion de 1 a 100
# # si es divisible por 3, imprimir "Fizz"
# # si es divisible por 5, imprimir "Buzz"
# # si es divisible por 3 y 5, solo imprimir "Luzz"

# arr = (1..100).to_a

# arr.each do |a|
#   if a%3 == 0 && !(a%5 ==0)
#     print a
#     puts "Fizz"
#   elsif a%5 == 0 && !(a%3 ==0)
#     print a
#     puts "Buzz"
#   elsif a%3 ==0 && a%5 ==0
#     print a
#     puts "Luzz"
#   end
# end

# Imprimir los numeros del 100 al 1,
# iteracion parta en 0 

# arr = crear 100..1


arr = (1..100).to_a
i = 0

until i == 101
  puts arr[i]
  i += 1
end