require 'test_helper'

class Admin::GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_game = admin_games(:one)
  end

  test "should get index" do
    get admin_games_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_game_url
    assert_response :success
  end

  test "should create admin_game" do
    assert_difference('Admin::Game.count') do
      post admin_games_url, params: { admin_game: {  } }
    end

    assert_redirected_to admin_game_url(Admin::Game.last)
  end

  test "should show admin_game" do
    get admin_game_url(@admin_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_game_url(@admin_game)
    assert_response :success
  end

  test "should update admin_game" do
    patch admin_game_url(@admin_game), params: { admin_game: {  } }
    assert_redirected_to admin_game_url(@admin_game)
  end

  test "should destroy admin_game" do
    assert_difference('Admin::Game.count', -1) do
      delete admin_game_url(@admin_game)
    end

    assert_redirected_to admin_games_url
  end
end
