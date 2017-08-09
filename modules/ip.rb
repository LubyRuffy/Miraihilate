DEFAULT_CIDR_PREFIX = 24

# Converts an IP string with a default
# CIDR prefix of 24, into an IPAddr object
def str_to_ip(ipstr)
	return str_to_ip ipstr, DEFAULT_CIDR_PREFIX
end

# Converts an IP string and CIDR prefix
# into an IPAddr object
def str_to_ip(ipstr, cidr_prefix)
	return IPAddr.new ipstr + '/' + cidr_prefix.to_s, Socket::AF_INET
end
