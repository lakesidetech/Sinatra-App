require 'sinatra'
require 'sinatra/reloader'
get '/' do
  'Hello world'
end
#   
get '/signup' do
end
 
get '/cars:name' do
 "This car is #{params["name"]}"
end

get '/myname/your:name2' do
 "My name is #{params["name2"].upcase}"
end

get '/time' do
     "my date is #{Time.now}"

end

get '/age_bracket:age' do

  age_sum =  "Hello you are :
  <% if #{params[:age].to_i} >= 18 %>;
     <%='Over age'%>
     <% else %>
    'Underage'
  <% end %>"
  erb age_sum
end