# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Article.create(title: 'Something Here', body: 'Lorem ipsum dolor sit amet consectetur adipiscing elit hac felis metus litora habitasse egestas, integer habitant tellus leo aptent nulla dictumst molestie cum aliquam eget. Felis urna libero dictum eu purus scelerisque accumsan laoreet fringilla massa porta vel, nisi cras nulla ut iaculis consequat vivamus ac mauris tellus diam ultrices ultricies, gravida quam sodales leo egestas curae nascetur in integer tortor rutrum. Libero mus risus ridiculus et in integer primis, eleifend torquent praesent ad tempus justo nullam, egestas eu placerat at etiam imperdiet. Nec risus nibh malesuada aliquet curabitur pharetra porttitor, augue convallis cubilia dignissim facilisi tincidunt sollicitudin etiam, egestas fusce mi nisi sapien pretium. Potenti morbi gravida pharetra risus ridiculus vivamus nostra felis porttitor, est vulputate urna ornare turpis elementum ac nullam, tortor sem torquent inceptos accumsan bibendum sed litora.')
# User.create(email: 'hustad.dev@gmail.com', password: '12345678', password_confirmation: '12345678', admin: true)
(1..100).each do |i|
  Article.create!(title: "Lipsum Post #{i}", body: %{
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. In feugiat purus dapibus fermentum sagittis. Fusce in tempus felis. Phasellus a erat ut lorem lacinia bibendum. Vivamus viverra facilisis neque, in scelerisque urna pharetra vel. Donec a est mauris. Integer eget metus quis eros egestas elementum. Integer bibendum risus hendrerit dapibus tempor. Fusce placerat in orci vitae tincidunt.
  },
  image_file_name: File.new(Rails.root + "app/assets/images/serversinside.jpg"),
  header_file_name: 	File.new(Rails.root + "app/assets/images/darkcode.jpg"))
end