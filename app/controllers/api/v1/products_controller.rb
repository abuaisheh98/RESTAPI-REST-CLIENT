module Api
  module V1
    class ProductsController < ApplicationController
      def index
        @products=Product.all
        render json:@products ,status: :ok
      end

      def update
        @product=Product.find(params[:id])
        if @product.update(product_params)
          render json:@product ,status: :ok
        else
          render json:@product ,status: :unprocessable_entity
        end

      end

      def show
        @product=Product.find(params[:id])
        render json:@product ,status: :ok
      end

      def create
        @product=Product.new(product_params)
        if @product.save
          render json:@product, status: :created
        else
          render json:@product, status: :unprocessable_entity
        end

      end

      def destroy
        @product=Product.find(params[:id])
        @product.destroy
        render json:@product, status: :ok
      end

      def product_params
        params.permit(:product_name, :price, :brand)
      end

    end
  end
end