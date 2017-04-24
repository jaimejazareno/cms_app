require 'spec_helper'

describe User do
  before { @user = User.new(fname: "Example User",lname: "Example User",username: "Example User",password: "Example User",password_confirmation: "Example User", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:fname) }
  it { should respond_to(:lname) }
  it { should respond_to(:username) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:email) }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
end
