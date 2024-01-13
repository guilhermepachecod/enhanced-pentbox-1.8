#!/usr/bin/env ruby


$pb_log_enabled = false
$pb_log_file = File.dirname(__FILE__) + "log_honeypot.txt"

$protected_mode = true

$text_color = true

###########################

##### Loading time
dir = File.dirname(__FILE__)
require dir + "/lib/pb_proced_lib.rb" # Common procedures and functions.

version = "1.8"
Signal.trap("INT") do
	pb_write_log("exiting", "Core")
	exit
end
#####

pb_write_log("pentbox loaded", "Core")

srand(Time.now.to_i)

sleep(0.25)
module_exec = true
require "#{dir}/autogeohoneypot.rb"
Network_pb::Honeypot_pb.new()

