require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index

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
 
 # getting the sum of two numbers
 get '/sum_two_numbers/:a/:b' do
   sum = " The of your values are: <%=#{params[:a]} + #{params[:b]}%>"
     erb sum 
 end
 
get '/signup/:age' do
  age = params["age"]
  @age = age.to_i

erb :signup
end

get '/list_tbl' do
  aa={
    "name"=> ["Alice", "Michael", "Jane", "Clare", "Mary", "John"],
    "age" => [20, 23, 43, 32, 23, 44],
    "country" => ["Kenya", "Tanzania", "Ghana", "Uganda", "Ethiopia", "Egypt"]
}   
@names=aa["name"]
@ages=aa["age"]
@countries=aa["country"]

 erb :list_tbl
 end
 
 get '/list_2' do
  
  data2 = [
  {name: "Alice", age:20, country: "Kenya"} ,
  {name: "Michael", age:  23, country: "Tanzania"},
  {name: "Jane", age: 43, country: "Ghana"},
  {name: "Clare", age: 32,  country: "Uganda"},
  {name: "Mary",  age: 23, country:  "Ethiopia"},
  {name: "John", age:4, country: "Egypt"}
  ]
#   @x=data2.each{|names|[:name]}
#   data2.each{|names|puts names[:name]}


#   data2.each do |i|
#     puts i
#  end
 
  @names1=data2[0][:name]
  @names2=data2[1][:name]
  @names3=data2[2][:name]
  @names4=data2[3][:name]
  @names5=data2[4][:name]
  @names6=data2[5][:name]
  
  @age1=data2[0][:age]
  @age2=data2[1][:age]
  @age3=data2[2][:age]
  @age4=data2[3][:age]
  @age5=data2[4][:age]
  @age6=data2[5][:age]

  
  erb :list_2
end

__END__

@@layout
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<%=yield%>
</body>
</html>
 
@@signup
<body>
<h1>Signup</h1>

<%if @age >= 18 %>
<p>Your are old enough to join us</p>
<%else%>
<p>Just wait for <%=18 - @age%> more years we are waiting<p>

<%end%>
</body>

@@list_tbl
<table border="1">
  <tr>
    <th>Name</th>
    <th>Age</th>
    <th>country</th>
  </tr>
  <tr>
    <td><%=@names[0]%><td> 
    <td><%=@ages[0]%></td>
    <td><%=@countries[0]%></td>
  </tr>
  <tr>
    <td><%=@names[1]%><td> 
    <td><%=@ages[1]%></td>
    <td><%=@countries[1]%></td>
  </tr>

  <tr>
  <td><%=@names[2]%><td> 
  <td><%=@ages[2]%></td>
  <td><%=@countries[2]%></td>
</tr>

<tr>
<td><%=@names[3]%><td> 
<td><%=@ages[3]%></td>
<td><%=@countries[3]%></td>
</tr>
<tr>
    <td><%=@names[4]%><td> 
    <td><%=@ages[4]%></td>
    <td><%=@countries[4]%></td>
  </tr>
  
  </table>

@@list_2
<p>"this is a new thing"<p>
<table>
<tr>
  <th>NAMES</th>
  <th>AGE</th>
  <th>country</th>
</tr>
<tr>
  <td><%=@names1%></td>
  <td><%=@age1%></td>
  <td></td>
</tr>
<tr>
  <td><%=@names2%></td>
  <td><%=@age2%></td>
  <td></td>
</tr>
<tr>
  <td><%=@names3%></td>
  <td><%=@age3%></td>
  <td></td>
</tr>
</table>

@@index
<h1>Users</h1>
<ul>
    <li>Jane</li>
    <li>John</li>
    <li>Doe</li>
</ul>


