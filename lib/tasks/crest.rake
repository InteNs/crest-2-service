namespace :crest do
  desc "start polling the clients for data"
  task poll_clients: :environment do
    test_client = OpenStruct.new(ip_address: '213.34.106.46')

    incoming_url = "http://#{test_client.ip_address}:8180/crest2/v1/api"

    outgoing = Faraday.new(
      url: 'https://fnxafeb9570f.hana.ondemand.com/Telemetry/Service/',
      headers: { 'Content-Type' => 'application/json', 'Authorization' => 'Basic VEVMRU1FVFJZX0NSRVNUMjpDcmVzdFNlY3VyZTEhMw==' }
    )

    while true
      puts "fetching data"
      resp = Faraday.get(incoming_url, { carState: 'true' })

      data = JSON.parse(resp.body)

      puts "sending #{data.dig('carState', 'mSpeed')}"
      resp_2 = outgoing.post('carState.xsjs', {
        'mSpeed' => data.dig('carState', 'mSpeed')
      }.to_json)

      puts "status: #{resp_2.status}"
    end
  end
end

