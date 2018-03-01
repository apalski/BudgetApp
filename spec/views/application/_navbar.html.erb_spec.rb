require "rails_helper"

RSpec.describe "application/_navbar.html.erb" do
  context "when no current_user" do
    it "displays options to sign up or in" do
      render("application/navbar.html.erb", current_user: nil)

      expect(rendered).to have_text(t("nav.signup"))
      expect(rendered).to have_text(t("nav.signin"))

      expect(rendered).not_to have_text(t("nav.user_profile"))
      expect(rendered).not_to have_text(t("nav.signout"))
    end
  end

  context "when current_user" do
    it "shows options to visit profile page and sign out" do
      render("application/navbar.html.erb", current_user: build_stubbed(:user))

      expect(rendered).to have_text(t("nav.user_profile"))
      expect(rendered).to have_text(t("nav.signout"))

      expect(rendered).not_to have_text(t("nav.signup"))
      expect(rendered).not_to have_text(t("nav.signin"))

      expect(rendered).not_to have_text(t("nav.user_index"))
    end
  end

  context "when admin" do
    it "shows options to see all users" do
      render(
        "application/navbar.html.erb",
        current_user: build_stubbed(:user, :admin),
      )

      expect(rendered).to have_text(t("nav.user_index"))
      expect(rendered).to have_text(t("nav.create_user"))

      expect(rendered).not_to have_text(t("nav.signup"))
      expect(rendered).not_to have_text(t("nav.signin"))
    end
  end
end
