FurryRobot::App.controllers  do
  get :index do
    render :form
  end

  post :index do
    REDIS.set params[:kind], params[:url]
    render :form
  end
end
