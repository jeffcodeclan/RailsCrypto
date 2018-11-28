require 'test_helper'

class CryptomoneysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cryptomoney = cryptomoneys(:one)
  end

  test "should get index" do
    get cryptomoneys_url
    assert_response :success
  end

  test "should get new" do
    get new_cryptomoney_url
    assert_response :success
  end

  test "should create cryptomoney" do
    assert_difference('Cryptomoney.count') do
      post cryptomoneys_url, params: { cryptomoney: { amount_owned: @cryptomoney.amount_owned, cost_per: @cryptomoney.cost_per, symbol: @cryptomoney.symbol, user_id: @cryptomoney.user_id } }
    end

    assert_redirected_to cryptomoney_url(Cryptomoney.last)
  end

  test "should show cryptomoney" do
    get cryptomoney_url(@cryptomoney)
    assert_response :success
  end

  test "should get edit" do
    get edit_cryptomoney_url(@cryptomoney)
    assert_response :success
  end

  test "should update cryptomoney" do
    patch cryptomoney_url(@cryptomoney), params: { cryptomoney: { amount_owned: @cryptomoney.amount_owned, cost_per: @cryptomoney.cost_per, symbol: @cryptomoney.symbol, user_id: @cryptomoney.user_id } }
    assert_redirected_to cryptomoney_url(@cryptomoney)
  end

  test "should destroy cryptomoney" do
    assert_difference('Cryptomoney.count', -1) do
      delete cryptomoney_url(@cryptomoney)
    end

    assert_redirected_to cryptomoneys_url
  end
end
