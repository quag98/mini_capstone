class Api::SuppliersController < ApplicationController
    # def all_supplier_action
    #   @suppliers = Supplier.all
    #   render "all_Supplier.json.jb"
    # end
  
    def single_supplier_action
      @supplier = Supplier.find_by(id: 1)
      render "single_Supplier.json.jb"
    end
  
    def single_search_action
      input_option = params["id_number"]
      @supplier = Supplier.find_by(id: input_option)
      render "query_param.json.jb"
    end
  
    def index
      @suppliers = Supplier.all
      if params["search"]
        @supplier = Supplier.where("name ILIKE ?", "%#{params[search]}%")
      end
      render "index.json.jb"
    end
  
    def show
      id_search = params["id"]
      @supplier = Supplier.find_by(id: id_search)
      render "show.json.jb"
    end
  
    def create
      @supplier = Supplier.new(
        name: params[:name],
        email: params[:email],
        phone_number: params[:phone_number],
      )
      if @supplier.save
        render "show.json.jb"
      end
      else
        render json: { errors: @supplier.errors.full_messages }, status: 406
      end
    end
  
    def update
      supplier_id = params["id"]
      @supplier = Supplier.find_by(id: supplier_id)
  
      @supplier.name = params[:name] || @supplier.name
      @supplier.email = params[:email] || @supplier.email
      @supplier.phone_number = params[:phone_number] || @supplier.phone_number
  
      if @supplier.save
        render "show.json.jb"
      else
        render json: {errors: @supplier.errors.full_messages}, status :406
      end
    end
  
    def destroy
      supplier_id = params["id"]
      @supplier = Supplier.find_by(id: supplier_id)
      @supplier.destroy
      render json: { message: "it is gone" }
    end
  end
  
end
