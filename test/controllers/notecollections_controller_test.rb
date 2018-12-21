require 'test_helper'

class NotecollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notecollection = notecollections(:one)
  end

  test "should get index" do
    get notecollections_url
    assert_response :success
  end

  test "should get new" do
    get new_notecollection_url
    assert_response :success
  end

  test "should create notecollection" do
    assert_difference('Notecollection.count') do
      post notecollections_url, params: { notecollection: { comment: @notecollection.comment, name: @notecollection.name } }
    end

    assert_redirected_to notecollection_url(Notecollection.last)
  end

  test "should show notecollection" do
    get notecollection_url(@notecollection)
    assert_response :success
  end

  test "should get edit" do
    get edit_notecollection_url(@notecollection)
    assert_response :success
  end

  test "should update notecollection" do
    patch notecollection_url(@notecollection), params: { notecollection: { comment: @notecollection.comment, name: @notecollection.name } }
    assert_redirected_to notecollection_url(@notecollection)
  end

  test "should destroy notecollection" do
    assert_difference('Notecollection.count', -1) do
      delete notecollection_url(@notecollection)
    end

    assert_redirected_to notecollections_url
  end
end
