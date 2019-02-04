require 'csv'

students = %w(Pavneet Catrin Vincent Shilpi Maria Therese Tobias Nina John Simantini Cecilia Marcus Mikael Lasse Zlatko Sebastian Oscar Charlotte Daniel Andreas Maureen Petra Achim Elina).sort
puts students.count
code_names = %w(funny_snake tiny_whale smart_donkey wild_pony kind_shark scary_spider mighty_duck soaring_eagle dancing_wolf smiling_gator happy_hippo zealous_zebra witty_tiger proud_lion fun_squirrel jolly_cheetah fast_ostrich black_panther silver_fox cool_giraffe fancy_bear silly_deer big_cat top_dog).shuffle
h = []

CSV.open("codenames.csv", 'wb') do |csv|
  until students.empty?
    student_name = students.shift.capitalize
    code_name = code_names.pop.split('_').map(&:capitalize).join(' ')
    h << [student_name, code_name]
    csv << [student_name, code_name]
  end
end
p h.sort_by(&:last)
[["Andreas", "Big Cat"],
["Mikael", "Black Panther"],
["Cecilia", "Cool Giraffe"],
["Charlotte", "Dancing Wolf"],
["Nina", "Fancy Bear"],
["Achim", "Fast Ostrich"],
["Therese", "Fun Squirrel"],
["Zlatko", "Funny Snake"],
["Simantini", "Happy Hippo"],
["Elina", "Jolly Cheetah"],
["Petra", "Kind Shark"],
["Marcus", "Mighty Duck"],
["Vincent", "Proud Lion"],
["Lasse", "Scary Spider"],
["Catrin", "Silly Deer"],
["John", "Silver Fox"],
["Oscar", "Smart Donkey"],
["Pavneet", "Smiling Gator"],
["Sebastian", "Soaring Eagle"],
["Maureen", "Tiny Whale"],
["Daniel", "Top Dog"],
["Tobias", "Wild Pony"],
["Maria", "Witty Tiger"],
["Shilpi", "Zealous Zebra"]]
