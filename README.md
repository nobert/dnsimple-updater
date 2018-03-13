# dnsimple-updater
This script enables one to update a [dnsimple](https://www.dnsimple.com/) as a dynamic DNS provider. It compares the current external IP address, via `icanhazip`, to what the dnsimple primary DNS server says, and if they differ, it updates the A record.

The `config.yml` file should contain the following information:

## Configuration

variable name | value
--- | ---
token |  [account token](https://developer.dnsimple.com/v2/#authentication)
account_id | [account id](https://developer.dnsimple.com/v2/accounts/#list-accounts)
zone | domain name, e.g. `example.com`
hostname | full hostname (fqdn), e.g. `host.example.com`
record_id | [record id](https://developer.dnsimple.com/v2/zones/records/#list) for hostname

## Usage

The obvious prerequisites are ruby and bundler. Just run `bundle install`.

Run the script `update.rb` in a scheduler, e.g. cron, as often as you'd like. I figure 5 minutes is fine.
