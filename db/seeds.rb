# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Excuse.create([
    { content: "The dog ate it.", count: 1 },
    { content: "My computer has a virus and so do all my pens and pencils.", count: 1 },
    { content: "My sister’s friend’s mother’s grandpa’s brother’s grandson’s uncle’s fish drowned.", count: 1 },
    { content: "I forgot.", count: 1 },
    { content: "I overslept.", count: 1 },
    { content: "I had to organize decorations for my dog’s birthday party.", count: 1 },
    { content: "I was there the entire time, you just didn’t notice me.", count: 1 },
    { content: "I’ve fallen and I can’t get up.", count: 1 },
    { content: "I don’t actually like you.", count: 1 },
    { content: "Once I realized you weren’t going to set me up with your brother/sister, I didn’t need to talk to you anymore.", count: 1 }
]);

Ocassion.create([
  { title: "Missed deadline" },
  { title: "Avoiding an event" },
  { title: "Wrongdoing to another" }
  ])
