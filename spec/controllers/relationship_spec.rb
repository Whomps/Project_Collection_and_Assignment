require 'rails_helper'

RSpec.describe RelationshipsController, :type => :controller do
  include Devise::TestHelpers
  before(:each) do
    @user = User.create(name: "David", email: "david@xyz.com", password: "1234567", uin: "456728360" , semester: "Fall" , year: "2016", course: "csce606")
    sign_in :user
  end
  describe "#create" do
    it "creates a successful relationships" do
      @rel = Relationship.create()
      @rel.should be_an_instance_of Relationship
    end
  end
end