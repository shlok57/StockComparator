require "sinatra"
require "nokogiri"
require "open-uri"

set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do 
	url = "http://money.rediff.com/"
	data = Nokogiri::HTML(open(url))
	@CurrSensex =  data.at_css('#bseindex').text
	@CurrSensex = 123.456
	@inp_cmpy_name = ""

	Tata = "500570"
	Reli = "500325"
	
	#url1 = url + Tata
	#data = Nokogiri::HTML(open(url1))
	#@CurrTata = data.at_css('#ltpid').text

	#url2 = url + Reli
	#data = Nokogiri::HTML(open(url2))
	#@CurrReli = data.at_css('#ltpid').text

	erb :webpage
end

post '/go/' do
  	@inp_cmpy_name = params[:inp]
  	#puts inp_cmpy_name
	url3 = "http://money.rediff.com/" + inp_cmpy_name + "/"
	data = Nokogiri::HTML(open(url3))
	@CurrPrc = data.at_css('#ltpid').text
	#puts CurrPrc
	erb :webpage1 , :locals => { 'inp_cmpy_name' => inp_cmpy_name , 'CurrPrc' => CurrPrc }
end