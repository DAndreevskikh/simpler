class TestsController < Simpler::Controller

  def custom_status
    status 201
    headers['Custom-Header'] = 'Value'
    render plain: "Status set to 201"
  end
  
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def create
    render plain: "Creating test..."
  end
end
