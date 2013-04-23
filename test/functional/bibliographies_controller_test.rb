require 'test_helper'

class BibliographiesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Bibliography.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Bibliography.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Bibliography.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to bibliography_url(assigns(:bibliography))
  end

  def test_edit
    get :edit, :id => Bibliography.first
    assert_template 'edit'
  end

  def test_update_invalid
    Bibliography.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Bibliography.first
    assert_template 'edit'
  end

  def test_update_valid
    Bibliography.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Bibliography.first
    assert_redirected_to bibliography_url(assigns(:bibliography))
  end

  def test_destroy
    bibliography = Bibliography.first
    delete :destroy, :id => bibliography
    assert_redirected_to bibliographies_url
    assert !Bibliography.exists?(bibliography.id)
  end
end
