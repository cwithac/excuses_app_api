require 'test_helper'

class ExcusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @excuse = excuses(:one)
  end

  test "should get index" do
    get excuses_url, as: :json
    assert_response :success
  end

  test "should create excuse" do
    assert_difference('Excuse.count') do
      post excuses_url, params: { excuse: { content: @excuse.content, count: @excuse.count } }, as: :json
    end

    assert_response 201
  end

  test "should show excuse" do
    get excuse_url(@excuse), as: :json
    assert_response :success
  end

  test "should update excuse" do
    patch excuse_url(@excuse), params: { excuse: { content: @excuse.content, count: @excuse.count } }, as: :json
    assert_response 200
  end

  test "should destroy excuse" do
    assert_difference('Excuse.count', -1) do
      delete excuse_url(@excuse), as: :json
    end

    assert_response 204
  end
end
