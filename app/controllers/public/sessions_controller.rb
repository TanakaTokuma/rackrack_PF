# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  # 退会したかの確認のアクション
  before_action :reject_customer, only: [:create]

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to books_path
  end


  # ログイン後のパス(後で変更する)
  def after_sign_in_path_for(resource)
    books_path
  end

  # ログアウト後のパス
  def after_sign_out_path_for(resource)
    root_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  def reject_customer

    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration_path
      end
    end
  end

end
