require 'test_helper'

class SiritorisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @siritori = siritoris(:one)
  end

  test "should get index" do
    get siritoris_url
    assert_response :success
  end

  test "should get new" do
    get new_siritori_url
    assert_response :success
  end

  test "should create siritori" do
    assert_difference('Siritori.count') do
      post siritoris_url, params: { siritori: { score: @siritori.score, word: @siritori.word } }
    end

    assert_redirected_to siritori_url(Siritori.last)
  end

  test "should show siritori" do
    get siritori_url(@siritori)
    assert_response :success
  end

  test "should get edit" do
    get edit_siritori_url(@siritori)
    assert_response :success
  end

  test "should update siritori" do
    patch siritori_url(@siritori), params: { siritori: { score: @siritori.score, word: @siritori.word } }
    assert_redirected_to siritori_url(@siritori)
  end

  test "should destroy siritori" do
    assert_difference('Siritori.count', -1) do
      delete siritori_url(@siritori)
    end

    assert_redirected_to siritoris_url
  end
end
