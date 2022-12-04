#!/usr/bin/env ruby
require 'io/console'
require 'net/http'
require 'open-uri'
require 'resolv'
require 'socket'
require 'timeout'


=begin
###############################################
Pure subdomain bruteforcer:
Original Author : Behrouz Sadeghipour
Co-Author: Rohan M.
Email  : hacktivist.ro@gmail.chom
http:://github.com/HacktivistRO
###############################################
=end

class String
def black;          "\e[30m#{self}\e[0m" end
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def brown;          "\e[33m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def magenta;        "\e[35m#{self}\e[0m" end
def cyan;           "\e[36m#{self}\e[0m" end
def brown;           "\e[37m#{self}\e[0m" end

def bg_black;       "\e[40m#{self}\e[0m" end
def bg_red;         "\e[41m#{self}\e[0m" end
def bg_green;       "\e[42m#{self}\e[0m" end
def bg_brown;       "\e[43m#{self}\e[0m" end
def bg_blue;        "\e[44m#{self}\e[0m" end
def bg_magenta;     "\e[45m#{self}\e[0m" end
def bg_cyan;        "\e[46m#{self}\e[0m" end
def bg_brown;        "\e[47m#{self}\e[0m" end

def bold;           "\e[1m#{self}\e[22m" end
def italic;         "\e[3m#{self}\e[23m" end
def underline;      "\e[4m#{self}\e[24m" end
def blink;          "\e[5m#{self}\e[25m" end
def reverse_color;  "\e[7m#{self}\e[27m" end
end

def host(get_host) #get cname data and check response code for 404 and alert user
  Resolv::DNS.open do |dns|
    res = dns.getresources get_host, Resolv::DNS::Resource::IN::CNAME
    if res.empty?
      break
    end

    heroku_error = "there is no app configured at that hostname".red.bold
    amazonAWS_error = "NoSuchBucket".red.bold
    squarespace_error = "No Such Account".red.bold
    github_error = "There isn't a GitHub Pages site here".red.bold
    shopify_error = "Sorry, this shop is currently unavailable.".red.bold
    tumblr_error = "There's nothing here.".red.bold
    wpengine_error = "The site you were looking for couldn't be found.".red.bold
    agilecrm_error = "Sorry, this page is no longer available.".red.bold
    fourzerofour_error = "404 Not Found".red.bold
    bitbucket_error = "Repository not found".red.bold
    campaignMonitor_error = "Trying to access your account?".red.bold
    digitalOcean_error = "Domain uses DO name servers with no records in DO.".red.bold
    gemfury_error = "404: This page could not be found.".red.bold
    ghost_error= "The thing you were looking for is no longer here, or never was".red.bold
    hatenaBlog_error = "404 Blog is not found".red.bold
    helpjuice_error = "We could not find what you're looking for.".red.bold
    helpScout_error = "No settings were found for this company:".red.bold
    intercom_error = "Uh oh. That page doesn't exist.".red.bold
    jetBrains_error = "is not a registered InCloud YouTrack".red.bold
    kinsta_error = "No Site For Domain".red.bold
    launchRock_error = "It looks like you may have taken a wrong turn somewhere. Don't worry...it happens to all of us.".red.bold
    ngrock_error = "Tunnel *.ngrok.io not found".red.bold
    pantheon_error = "404 error unknown site!".red.bold
    pingdom_error = "Sorry, couldn't find the status page".red.bold
    readmeio_error = "Project doesnt exist... yet!".red.bold
    shortio_error = "Link does not exist".red.bold
    smartJobBoard_error = "This job board website is either expired or its domain name is invalid.".red.bold
    pageNotFound_error = "page not found".red.bold
    surgesh_error = "project not found".red.bold
    surveySparrow_error = "'Ouch! Account not found'".red.bold
    uberFlip_error = "Non-hub domain, The URL you've accessed does not provide a hub.".red.bold
    wordpress_engine = "Do you want to register *.wordpress.com?".red.bold
    worksites_error = "Hello! Sorry, but the website you&rsquo;re looking for doesn&rsquo;t exist.".red.bold

    check_it = ""
    real_host = res.first.name.to_s
      check_real_host = "http://"+real_host
      check_it = Net::HTTP.get(URI.parse(check_real_host))
      if  (check_it.index("There is no app configured at that hostname"))
        puts "- Subdomain pointing to a non-existing Heroku app showing: ".red + heroku_error
      elsif (check_it.index("NoSuchBucket"))
        puts "- Subdomain pointing to an unclaimed AmazonAWS bucket showing: ".red + amazonAWS_error
      elsif (check_it.index("No Such Account"))
        puts "- Subdomain pointing to a non-existing SquareSpace account showing: ".red + squarespace_error
      elsif (check_it.index("You're Almost There"))
        puts "- Subdomain pointing to a non-existing SquareSpace account showing: ".red + squarespace_error
      elsif (check_it.index("There isn't a GitHub Pages site here"))
        puts "- Subdomain pointing to a non-existing Github subdomain indicating".red + github_error
      elsif (check_it.index("Sorry, this shop is currently unavailable."))
        puts "- Subdomain pointing to a non-existing Shopify subdomain indicating".red + shopify_error
      elsif (check_it.index("There's nothing here."))
        puts "- Subdomain pointing to a non-existing Tumblr subdomain indicating".red + tumblr_error
      elsif  (check_it.index("The site you were looking for couldn't be found."))
        puts "- Subdomain pointing to a non-existing WPEngine subdomain indicating".red + wpengine_error
      elsif  (check_it.index("Sorry, this page is no longer available."))
        puts "- Subdomain pointing to a non-existing AgileCRM subdomain indicating".red + agilecrm_error
      elsif  (check_it.index("404 Not Found"))
        puts "- Subdomain pointing to a non-existing subdomain indicating".red + fourzerofour_error
      elsif  (check_it.index("Repository not found"))
        puts "- Subdomain pointing to a non-existing BitBucket subdomain indicating".red + bitbucket_error
      elsif  (check_it.index("Trying to access your account?"))
        puts "- Subdomain pointing to a non-existing Campaign Monitor subdomain indicating".red + campaignMonitor_error
      elsif  (check_it.index("Domain uses DO name servers with no records in DO."))
        puts "- Subdomain pointing to a non-existing Digital Ocean subdomain indicating".red + digitalOcean_error
      elsif  (check_it.index("404: This page could not be found."))
        puts "- Subdomain pointing to a non-existing Gemfury subdomain indicating".red + gemfury_error
      elsif  (check_it.index("The thing you were looking for is no longer here, or never was"))
        puts "- Subdomain pointing to a non-existing Ghost subdomain indicating".red + ghost_error
      elsif  (check_it.index("404 Blog is not found"))
        puts "- Subdomain pointing to a non-existing Hatena Blog subdomain indicating".red + hatenaBlog_error
      elsif  (check_it.index("We could not find what you're looking for."))
        puts "- Subdomain pointing to a non-existing Help Juice subdomain indicating".red + helpjuice_error
      elsif  (check_it.index("No settings were found for this company:"))
        puts "- Subdomain pointing to a non-existing Help Scout subdomain indicating".red + helpScout_error
      elsif  (check_it.index("Uh oh. That page doesn't exist."))
        puts "- Subdomain pointing to a non-existing Intercom subdomain indicating".red + intercom_error
      elsif  (check_it.index("is not a registered InCloud YouTrack"))
        puts "- Subdomain pointing to a non-existing JetBrains subdomain indicating".red + jetBrains_error
      elsif  (check_it.index("No Site For Domain"))
        puts "- Subdomain pointing to a non-existing Kinsta subdomain indicating".red + kinsta_error
      elsif  (check_it.index("It looks like you may have taken a wrong turn somewhere. Don't worry...it happens to all of us."))
        puts "- Subdomain pointing to a non-existing LaunchRock subdomain indicating".red + launchRock_error
      elsif  (check_it.index("Tunnel *.ngrok.io not found"))
        puts "- Subdomain pointing to a non-existing Ngrok subdomain indicating".red + ngrock_error
      elsif  (check_it.index("404 error unknown site!"))
        puts "- Subdomain pointing to a non-existing Pantheon subdomain indicating".red + pantheon_error
      elsif  (check_it.index("Sorry, couldn't find the status page"))
        puts "- Subdomain pointing to a non-existing Pingdom subdomain indicating".red + pingdom_error
      elsif  (check_it.index("Project doesnt exist... yet!"))
        puts "- Subdomain pointing to a non-existing Readme.io subdomain indicating".red + readme_error
      elsif  (check_it.index("Link does not exist"))
        puts "- Subdomain pointing to a non-existing Short.io subdomain indicating".red + shortio_error
      elsif  (check_it.index("This job board website is either expired or its domain name is invalid."))
        puts "- Subdomain pointing to a non-existing SmartJobBoard subdomain indicating".red + smartJobBoard_error
      elsif  (check_it.index("page not found"))
        puts "- Subdomain pointing to a non-existing subdomain indicating".red + pageNotFound_error
      elsif  (check_it.index("project not found"))
        puts "- Subdomain pointing to a non-existing Surge.sh subdomain indicating".red + surgesh_error
      elsif  (check_it.index("'Ouch! Account not found'"))
        puts "- Subdomain pointing to a non-existing SurveySparrow subdomain indicating".red + surveySparrow_error
      elsif  (check_it.index("Non-hub domain, The URL you've accessed does not provide a hub."))
        puts "- Subdomain pointing to a non-existing Uberflip subdomain indicating".red + uberFlip_error
      elsif  (check_it.index("Do you want to register *.wordpress.com?"))
        puts "- Subdomain pointing to a non-existing Wordpress subdomain indicating".red + wordpress_engine
       elsif  (check_it.index("Hello! Sorry, but the website you&rsquo;re looking for doesn&rsquo;t exist.  "))
        puts "- Subdomain pointing to a non-existing Wordsites subdomain indicating".red + worksites_error
      end
      #if (real_host = get_host)
      #else
        puts ("- Seems like " + get_host +  " is an alias for " + real_host).brown
      #end
  end
  return
end

def find_subs(targetURI)
      target = "http://"+targetURI
        begin
          #Timeout::timeout(600) {
            res = Net::HTTP.get_response(URI.parse(target))
            getCode = res.code
            ip_address = Resolv.getaddress targetURI
            if (getCode != "503")
              File.open("output.txt", "a") do |file|
                file.puts targetURI
              end
              puts  "[#{Time.now.asctime}] " + getCode + " " + targetURI.green + " ---> " + ip_address + " "
              if (ip_address == "127.0.0.1")
                puts "Sub domain is poiting to localhost --> Check for more details".red
              else
              end
              host targetURI
            else
            end

            if getCode == "404"
              puts "----> Check for further information on where this is pointing to.".red
            end
          #}

        rescue Timeout::Error
        rescue Errno::EHOSTUNREACH
        rescue URI::InvalidURIError
        rescue SocketError
        rescue Errno::ECONNREFUSED
        rescue Resolv::ResolvError
        rescue Errno::ETIMEDOUT
        rescue Errno::ENETUNREACH
        end
#        recursiveBruteForce
end


def createURI(getURI)
  File.open("list.txt", "r") do |f|
    f.each_line do |line|
      targetURI = line.chomp + "." + getURI
      find_subs targetURI
    end
  end
end

def createURIThreaded(getURI)
  total_threads = 100 #safe value
  queue = Queue.new 
  File.open("list.txt", "r") do |f|
    f.each_line do |line|
      targetURI = line.chomp + "." + getURI
      queue << targetURI
    end
    workers = total_threads.times.map do
      Thread.new do
        begin
          while targetURI = queue.pop(true)
            find_subs targetURI
          end
        rescue ThreadError
        end
      end
    end
    workers.map(&:join)
  end
end



File.open("output.txt", "w")
system "clear"
puts "Enter a domain you'd like to brute force and look for hostile subdomain takeover(example: rohan-website.com)"
fastmode = ARGV.include? '--fast'
ARGV.clear
getURI = gets.chomp
unless fastmode then
  createURI getURI
else 
  createURIThreaded getURI
end

puts "\n\n\n\n\n[#{Time.now.asctime}] Starting to bruteforce the subdomains using the same wordlist"
File.open("output.txt", "r").each do |ff|
    ff.each_line do |domain|
      targetURI = domain.chomp
      unless fastmode then
        createURI targetURI
      else 
        createURIThreaded targetURI
      end
    end
end
