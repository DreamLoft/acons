require 'test_helper'

class ConstructionStockIssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @construction_stock_issue = construction_stock_issues(:one)
  end

  test "should get index" do
    get construction_stock_issues_url
    assert_response :success
  end

  test "should get new" do
    get new_construction_stock_issue_url
    assert_response :success
  end

  test "should create construction_stock_issue" do
    assert_difference('ConstructionStockIssue.count') do
      post construction_stock_issues_url, params: { construction_stock_issue: { construction_stock_id: @construction_stock_issue.construction_stock_id, issue_date: @construction_stock_issue.issue_date, issued_to: @construction_stock_issue.issued_to, quanity: @construction_stock_issue.quanity } }
    end

    assert_redirected_to construction_stock_issue_url(ConstructionStockIssue.last)
  end

  test "should show construction_stock_issue" do
    get construction_stock_issue_url(@construction_stock_issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_construction_stock_issue_url(@construction_stock_issue)
    assert_response :success
  end

  test "should update construction_stock_issue" do
    patch construction_stock_issue_url(@construction_stock_issue), params: { construction_stock_issue: { construction_stock_id: @construction_stock_issue.construction_stock_id, issue_date: @construction_stock_issue.issue_date, issued_to: @construction_stock_issue.issued_to, quanity: @construction_stock_issue.quanity } }
    assert_redirected_to construction_stock_issue_url(@construction_stock_issue)
  end

  test "should destroy construction_stock_issue" do
    assert_difference('ConstructionStockIssue.count', -1) do
      delete construction_stock_issue_url(@construction_stock_issue)
    end

    assert_redirected_to construction_stock_issues_url
  end
end
