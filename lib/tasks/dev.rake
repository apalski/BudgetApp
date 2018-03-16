if Rails.env.development? || Rails.env.test?
  require "factory_bot"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryBot::Syntax::Methods
      User.delete_all

      User.create(
        name: "admin",
        email: "admin@example.com",
        password: "secret",
        admin: true,
      )
<<<<<<< HEAD
<<<<<<< HEAD
=======
      # 
      # 9.times do
      #   budget = create(:budget)
      #   budget.expenses.create
      #   print "."
      # end
=======
>>>>>>> 567cd71... Remove budget expense creation dev.rake

>>>>>>> cd27428... Refactor dev.rake
      puts "Done!"
    end
  end
end
