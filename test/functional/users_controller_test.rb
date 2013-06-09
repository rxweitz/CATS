require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { active: @user.active, addcontactid: @user.addcontactid, adddttm: @user.adddttm, address1: @user.address1, address2: @user.address2, address3: @user.address3, approvercontactid: @user.approvercontactid, approverdollars: @user.approverdollars, cellphone: @user.cellphone, city: @user.city, contactcode: @user.contactcode, contactid: @user.contactid, country: @user.country, department: @user.department, email: @user.email, faxphone: @user.faxphone, firstname: @user.firstname, lastname: @user.lastname, locationdetailid: @user.locationdetailid, locked: @user.locked, managecontactid: @user.managecontactid, managedttm: @user.managedttm, middlename: @user.middlename, mobilityversion: @user.mobilityversion, orderdefaultid: @user.orderdefaultid, pagerphone: @user.pagerphone, password: @user.password, passwordchange: @user.passwordchange, phone: @user.phone, postalcode: @user.postalcode, securityprofileid: @user.securityprofileid, stateprovince: @user.stateprovince, supervisorcontactid: @user.supervisorcontactid, title: @user.title, url: @user.url }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { active: @user.active, addcontactid: @user.addcontactid, adddttm: @user.adddttm, address1: @user.address1, address2: @user.address2, address3: @user.address3, approvercontactid: @user.approvercontactid, approverdollars: @user.approverdollars, cellphone: @user.cellphone, city: @user.city, contactcode: @user.contactcode, contactid: @user.contactid, country: @user.country, department: @user.department, email: @user.email, faxphone: @user.faxphone, firstname: @user.firstname, lastname: @user.lastname, locationdetailid: @user.locationdetailid, locked: @user.locked, managecontactid: @user.managecontactid, managedttm: @user.managedttm, middlename: @user.middlename, mobilityversion: @user.mobilityversion, orderdefaultid: @user.orderdefaultid, pagerphone: @user.pagerphone, password: @user.password, passwordchange: @user.passwordchange, phone: @user.phone, postalcode: @user.postalcode, securityprofileid: @user.securityprofileid, stateprovince: @user.stateprovince, supervisorcontactid: @user.supervisorcontactid, title: @user.title, url: @user.url }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
