# TestCase: Understand upon what circumstances do we get RestClient::ServerBrokeConnection error

headers = { accept: "text/plain" }
begin
  response = RestClient::Request.execute(
    method: :get,
    url: 'https://httpbin.org/status/503',
    headers: headers,
  )
rescue RestClient::ServerBrokeConnection => e
  puts e
end
