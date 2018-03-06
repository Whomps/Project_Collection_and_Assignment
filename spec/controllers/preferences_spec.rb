require 'rails_helper'

RSpec.describe PreferencesController, :type => :controller do
  include Devise::TestHelpers

  before(:each) do
    @user = User.create!(name: "David", email: "david@xyz.com", password: "1234567", uin: "456728360" , semester: "Fall" , year: "2016", course: "csce606" )
    sign_in :user
    @pro = Project.create!(title: "project1", organization: "org1", contact: "xyz", description: "abc")
  end
  describe "#create" do
    it "creates a successful preference" do
      @pref = Preference.create()
      @pref.should be_an_instance_of Preference
    end
  end
end