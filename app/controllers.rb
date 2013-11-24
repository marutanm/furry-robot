FurryRobot::App.controllers  do
  get :index do
    render :form, locals: { success: REDIS.lrange(:success, 0, -1), failure: REDIS.lrange(:failure, 0, -1) }
  end

  post :index do
    REDIS.lpush params[:kind], params[:url]
    render :form
  end

  get :index, :with => :kind do
    urls = REDIS.lrange(params[:kind], 0, -1)
    render :slim, "img src=\"#{urls.sample || ''}\""
  end
end
