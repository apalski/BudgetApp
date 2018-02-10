describe NullUser do
  context "method missing" do
    it "returns nil for any method call" do
      null = NullUser.new

      expect(null.missing_method).to be_nil
      expect(null.something_other_missing_method(1, 2, 3)).to be_nil
    end

    it "responds to missing methods" do
      null = NullUser.new

      expect(null.respond_to?(:missing_method)).to be true
    end
  end

  context "responds to User public interface" do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:budgets) }
  end
end
