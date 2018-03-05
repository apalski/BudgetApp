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
        admin: true
      )

      9.times do
        budget = create(:budget)
        budget.expenses.create
        print "."
      end

      puts "Done!"
    end
  end
end
