class TestsController < Simpler::Controller
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
