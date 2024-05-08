require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
    test 'render a list product' do
        get products_path
        assert_response :success
        assert_select '.product', 2
    end

    test 'render a detailed product page' do
        get product_path(products(:one))
        assert_response :success
        assert_select '.title', 'PS'
        assert_select '.description', '1 buen estado'
        assert_select '.price', '10'
    end

    test 'render form for new product' do
        get new_product_path
        assert_response :success
        assert_select 'form'
    end

    test 'allow to create a new product' do
        post products_path, params:{
            product: {
                title: 'Nintendo 64',
                description: 'Antiguedad poco valiosa',
                price: 50
            }
        }
        assert_redirected_to products_path
        assert_equal flash[:notice], 'Creacion exitosa'
    end

    test 'does not allow to create a new product' do
        post products_path, params:{
            product: {
                description: 'Antiguedad poco valiosa',
                price: 50
            }
        }
        assert_response :unprocessable_entity
    end

    test 'render form for edit product' do
        get edit_product_path(products(:one))
        assert_response :success
        assert_select 'form'
    end

    test 'allow to edit a new product' do
        patch product_path(products(:one)), params:{
            product: {
                price: 85
            }
        }
        assert_redirected_to products_path
        assert_equal flash[:notice], 'Actualizacion Exitosa'
    end

    test 'does not allow to edit a new product' do
        patch product_path(products(:one)), params:{
            product: {
                price: nil
            }
        }
        assert_response :unprocessable_entity
    end

    test 'can delete products' do
        assert_difference('Product.count', -1) do
            delete product_path(products(:one))
        end
        assert_redirected_to products_path
        assert_equal flash[:notice], 'Eliminacion Exitosa'
    end

end