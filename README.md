# HostileSubBruteForcer
Agenda: Bruteforce subdomains for subdomains takeover and enumerate the service pointing to. 

The original script [@Nahamsec/HostileSubBruteForcer](https://github.com/nahamsec/HostileSubBruteforcer) had only five services to check for. I added twenty-one more services that can be tested!

Installation and Usage:
    
    git clone https://github.com/HacktivistRO/HostileSubBruteForcer
    cd HostileSubBruteForcer
    ruby sub_brute.rb
    
TIP: For multi-threaded brute-forcing:
    
    ruby sub_brute.rb --fast 
    
I will strongly recommend using my subdomain enumeratiion wordlist for extensive testing of subdomain takeover. My wordlist can be found here: [@HacktivistRO/Wordlists](https://github.com/HacktivistRO/Bug-Bounty-Wordlists)

To use another wordlist:
    
    git clone https://github.com/HacktivistRO/Bug-Bounty-Wordlists/
    cd Bug-Bounty-Wordlists/
    cat subdomains-1.txt subdomains-2.txt subdomains-3.txt > list.txt
    Now move "list.txt" to your HostileSubBruteForcer folder and replace it with the existing file.
    
Documentation for the script can be found here: [@Nahamsec/HostileSubBruteForcer](https://github.com/nahamsec/HostileSubBruteforcer)

Credits:
[@Nahamsec/HostileSubBruteForcer](https://github.com/nahamsec/HostileSubBruteforcer) for writing an amazing script.
[@EdOverflow/can-i-take-over-xyz](https://github.com/EdOverflow/can-i-take-over-xyz) for centralized repository of error messages
