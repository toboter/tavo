require 'test_helper'

class ImagetagsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Imagetag.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Imagetag.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Imagetag.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to imagetag_url(assigns(:imagetag))
  end

  def test_edit
    get :edit, :id => Imagetag.first
    assert_template 'edit'
  end

  def test_update_invalid
    Imagetag.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Imagetag.first
    assert_template 'edit'
  end

  def test_update_valid
    Imagetag.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Imagetag.first
    assert_redirected_to imagetag_url(assigns(:imagetag))
  end

  def test_destroy
    imagetag = Imagetag.first
    delete :destroy, :id => imagetag
    assert_redirected_to imagetags_url
    assert !Imagetag.exists?(imagetag.id)
  end
end
