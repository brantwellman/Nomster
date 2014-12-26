require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
	
	test "new" do
		user = FactoryGirl.create(:user)
		sign_in user

		get :new
		assert_response :success
	end

	test "create" do
		user = FactoryGirl.create(:user)
		sign_in user

		assert_difference 'Place.count' do
			post :create, {:place => {:name => "Brewery", :description => "Great place", :address => "Here"}}
		end

		assert_redirected_to root_path

		place=Place.last
		assert_equal "Brewery", place.name
	end

	test "update validation error" do
		user =  FactoryGirl.create(:user)
		place = FactoryGirl.create(:place)
		sign_in place.user

		put :update, :id => place.id, :place => {:name => 'omg' }

		assert place.reload.name.present?
		assert_response :uprocessable_entry
	end

	test "update as different user" do
		sign_in FactoryGirl.create(:user )
		place = FactoryGirl.create(:place, :name => 'omggg')

		put :update, :id => place.id, :place => {:name => 'This one'}

		assert_response :forbidden
	end
end
