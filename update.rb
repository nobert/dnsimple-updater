#!/usr/bin/ruby
require 'dnsimple'
require 'yaml'
require 'resolv'

config = YAML.load_file('config.yml')
token = config['token']
account_id = config['account_id']
zone = config['zone']
record_id = config['record_id']
hostname = config['hostname']

def haz_ip
 	url = URI.parse "http://icanhazip.com"
 	Net::HTTP.get_response(url).body.chomp
end

def dns_ip(hostname)
	Resolv.getaddress hostname
end

def update_ip(token, account_id, zone, record_id, ip)
	client = Dnsimple::Client.new(access_token: token)

	# Fetch your details
	response = client.identity.whoami   # execute the call
	response.data                       # extract the relevant data from the response or
	client.identity.whoami.data         # execute the call and get the data in one line

	# Get a domain
	response = client.zones.update_record(account_id, zone, record_id, content: ip)
end

my_ip = haz_ip
old_ip = dns_ip(hostname)

if my_ip != old_ip
	update_ip(token, account_id, zone, record_id, my_ip)
	puts "updated ip to #{my_ip}"
end
