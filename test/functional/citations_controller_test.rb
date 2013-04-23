require 'test_helper'

class CitationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Citation.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Citation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Citation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to citation_url(assigns(:citation))
  end

  def test_edit
    get :edit, :id => Citation.first
    assert_template 'edit'
  end

  def test_update_invalid
    Citation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Citation.first
    assert_template 'edit'
  end

  def test_update_valid
    Citation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Citation.first
    assert_redirected_to citation_url(assigns(:citation))
  end

  def test_destroy
    citation = Citation.first
    delete :destroy, :id => citation
    assert_redirected_to citations_url
    assert !Citation.exists?(citation.id)
  end
end
