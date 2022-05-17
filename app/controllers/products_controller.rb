class ProductsController < ApplicationController

    def index
        @products = Product.all
        render json: @products, status: :ok
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            render json: @product, status: :created
        else
            render json: @product.errors, status: :unprocessable_entity
        end

    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            render json: @product, status: :ok
        else
            render json: @product.errors, status: :unprocessable_entity
        end
    end


    private
    def product_params
        params.require(:product).permit(:name, :description, :quantity, :price )
    end
end
