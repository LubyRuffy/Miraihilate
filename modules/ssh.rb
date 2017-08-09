# Attempts to SSH into the device to
# check if it is vulnerable and if so
# alert the device
def perform_ssh_scan(interface, ip)
	puts 'Attempting to SSH into device ' + ip.to_s

	# Brute force combinations to access device
	IOT_ROOT_COMBINATIONS.each do |(user, pass)|
		Net::SSH.start(ip.to_s, user, :password => pass) do |ssh|
			# Capture all stderr and stdout from remote process
			output = ssh.exec!('hostname')
			puts output

			puts 'Device is vulnerable! Sending alert..'

			# send alert
			ssh.exec!('sudo wall -n "Your device has been detected as vulnerable by Miraihilate!\nPlease change your root username and password to something more secure!"')

			VULNERABLE_DEVICES.push ip
		end
	end
end
