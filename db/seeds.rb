# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(id: 1, username: :admin, password: '123456')

pets = Pet.create([
                      {name: '哈士奇', species: 'dog', gender: 'male', provider_id: '1'},
                      {name: '布偶猫', species: 'cat', gender: 'female', provider_id: '1'},
                      {name: '挪威森林猫', species: 'cat', gender: 'male', provider_id: '1'},
                      {name: '柴犬', species: 'dog', gender: 'female', provider_id: '1'},
                      {name: '秋田犬', species: 'dog', gender: 'male', provider_id: '1'},
                      {name: '缅因猫', species: 'cat', gender: 'female', provider_id: '1'},
                      {name: '英国短毛猫', species: 'cat', gender: 'male', provider_id: '1'},
                      {name: '萨摩耶', species: 'dog', gender: 'female', provider_id: '1'},])
