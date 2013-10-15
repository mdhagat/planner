require 'test_helper'

class ProvidersControllerTest < ActionController::TestCase
  setup do
    @provider = providers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:providers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provider" do
    assert_difference('Provider.count') do
      post :create, provider: { city: @provider.city, country_region: @provider.country_region, description: @provider.description, name: @provider.name, phone: @provider.phone, pin_zip: @provider.pin_zip, provider_type: @provider.provider_type, state_provice: @provider.state_provice, street_address1: @provider.street_address1, street_address2: @provider.street_address2, thumbnail: @provider.thumbnail, url: @provider.url }
    end

    assert_redirected_to provider_path(assigns(:provider))
  end

  test "should show provider" do
    get :show, id: @provider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provider
    assert_response :success
  end

  test "should update provider" do
    patch :update, id: @provider, provider: { city: @provider.city, country_region: @provider.country_region, description: @provider.description, name: @provider.name, phone: @provider.phone, pin_zip: @provider.pin_zip, provider_type: @provider.provider_type, state_provice: @provider.state_provice, street_address1: @provider.street_address1, street_address2: @provider.street_address2, thumbnail: @provider.thumbnail, url: @provider.url }
    assert_redirected_to provider_path(assigns(:provider))
  end

  test "should destroy provider" do
    assert_difference('Provider.count', -1) do
      delete :destroy, id: @provider
    end

    assert_redirected_to providers_path
  end
end
