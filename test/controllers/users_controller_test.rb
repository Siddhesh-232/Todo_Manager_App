class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should list users" do
    get users_url
    assert_response :success
    sidd = users(:sidd)
    shrey = users(:shrey)
    assert_match sidd.name, response.body
    assert_match sidd.email, response.body
    assert_match shrey.name, response.body
    assert_match shrey.email, response.body
  end

  test "should create users" do
    new_user_name = "Akash L"
    new_user_email = "akash@example.com"
    new_user_password = "password3"
    post users_url, params: { name: new_user_name, email: new_user_email, password: new_user_password }
    assert_response :success
    assert_equal User.count, 3
    new_user = User.find_by!(email: new_user_email)
    assert_equal new_user.password, new_user_password
    get users_url
    assert_match new_user_name, response.body
    assert_match new_user_email, response.body
  end

  test "should login users" do
    sidd = users(:sidd)
    post "/users/login", params: { email: sidd.email, password: sidd.password }
    assert_match "true", response.body

    post "/users/login", params: { email: sidd.email, password: "incorrect_password" }
    assert_match "false", response.body

    post "/users/login", params: { email: "unknown@example.com", password: "doesnt_matter" }
    assert_match "false", response.body
  end
end
