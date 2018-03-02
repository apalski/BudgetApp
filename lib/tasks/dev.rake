if Rails.env.development? || Rails.env.test?
  require "factory_bot"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryBot::Syntax::Methods

      create(:budget, user: User.create(
        name: "admin",
        email: "admin@example.com",
        password: "secret",
        admin: true
      ))

      9.times do
        create(:budget, user: create(:user))
      end

      User.all.each do |user|
        9.times do
          create(:expense, budget: user.budget)
        end
      end

      puts "Done!"
    end
  end
end
