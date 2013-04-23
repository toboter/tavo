require 'test_helper'

class AppellationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Appellation.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Appellation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Appellation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to appellation_url(assigns(:appellation))
  end

  def test_edit
    get :edit, :id => Appellation.first
    assert_template 'edit'
  end

  def test_update_invalid
    Appellation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Appellation.first
    assert_template 'edit'
  end

  def test_update_valid
    Appellation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Appellation.first
    assert_redirected_to appellation_url(assigns(:appellation))
  end

  def test_destroy
    appellation = Appellation.first
    delete :destroy, :id => appellation
    assert_redirected_to appellations_url
    assert !Appellation.exists?(appellation.id)
  end
end
