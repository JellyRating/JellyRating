class SessionsController < ApplicationController
    skip_before_filter :set_current_user

    def new    
        redirect_to user_path current_user if logged_in?
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if succesfully_login user
            flash[:notice] = "Welcome back, #{user.name}."
            log_in user
            params[:remember_me] == "1" ? remember(user) : forget(user)
            redirect_to_last_page
        else
            flash[:warning] = ['Invalid email/password combination']
            render 'new'
        end
    end

    def destroy
        log_out if logged_in?
        redirect_to login_path
    end


    def succesfully_login user
        return (user and user.authenticate(params[:session][:password]))
    end

    def redirect_to_last_page
        if(session[:return_to].nil?)
            redirect_to root_url
        else
            return_to = session[:return_to]
            session.delete(:return_to)
            redirect_to return_to
        end
    end
end
