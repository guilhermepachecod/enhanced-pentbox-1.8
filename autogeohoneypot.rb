

module Network_pb
    class Honeypot_pb
    def initialize()
    
    require "socket"
    require 'ipinfo'

    def geoipLocation(ip_address)

        access_token = 'XXXXXXXXXXXXX'
        handler = IPinfo::create(access_token)
        details = handler.details(ip_address)
        city = details.city # Emeryville
        loc = details.loc # 37.8342,-122.2900
        region = details.region
        org = details.org
        country = details.country_name
        ip = details.ip

        return "#{ip} #{country} #{city} #{org}"
    end
    def honeyconfig(port, message, sound, log, logname) # Function to launch the Honeypot.
        begin
            tcpserver = TCPServer.new("", port)
            if tcpserver
                if log == "y" || log == "Y"
                    # If log is enabled, writes Honeypot activation time.
                    begin
                        File.open(logname, "a") do |logf|
                            logf.puts "  HONEYPOT ACTIVATED ON PORT #{port} (#{Time.now.to_s})"
                        end
                    rescue Errno::ENOENT
                    end
                end
                loop do
                    socket = tcpserver.accept
                    sleep(1) # It is to solve possible DoS Attacks.
                    if socket
                        Thread.new do
                            remotePort, remoteIp = Socket.unpack_sockaddr_in(socket.getpeername) # Gets the remote port and ip.
                            reciv = socket.recv(1000).to_s
                            puts "#{Time.now.to_s} #{geoipLocation(remoteIp)}" 
                            puts reciv
                            if log == "y" || log == "Y"
                                # If log is enabled, writes the intrusion.
                                begin
                                    File.open(logname, "a") do |logf|
                                        logf.puts "#{Time.now.to_s} #{geoipLocation(remoteIp)}" 
                                        logf.puts "#{remoteIp}:#{remotePort}"
                                        logf.puts port
                                        logf.puts reciv
                                    end
                                rescue Errno::ENOENT
                                end
                            end
                            sleep(2) # This is a sticky honeypot.
                            socket.write(message)
                            socket.close
                        end
                    end
                end
            end
        rescue Errno::EACCES
        rescue Errno::EADDRINUSE
        rescue
        end
    end
    
    if ARGV.empty?
        puts "Usage: ruby run.rb <port>"
        exit 1
      end
    port = ARGV[0]
    message = "Connecting..."
    logname = "log_honeypot.txt"
    log = "y"
    sound = "n"
    honeyconfig(port, message, sound, log, logname)
    
    end
    end
    end
    