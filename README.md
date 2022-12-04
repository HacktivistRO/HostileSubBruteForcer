# HostileSubBruteForcer
Agenda: Bruteforce subdomains for subdomains takeover and enumerate the service pointing to
Inspired by: [@Nahamsec/HostileSubBruteForcer](https://github.com/nahamsec/HostileSubBruteforcer)

The original script has only five services to check for. I added twenty-one more services that can be tested!

I will strongly recommend using my subdomain enumeratiion wordlist for extensive testing of subdomain takeover. My wordlist can be found here: [@HacktivistRO/Wordlists](https://github.com/HacktivistRO/Bug-Bounty-Wordlists)

Installation and Usage:
    
    git clone https://github.com/HacktivistRO/HostileSubBruteForcer
    cd HostileSubBruteForcer
    ruby sub_brute.rb
    
To use another wordlist:
    
    git clone https://github.com/HacktivistRO/Bug-Bounty-Wordlists/
    cd Bug-Bounty-Wordlists/
    cat subdomains-1.txt subdomains-2.txt subdomains-3.txt > list.txt
    Now move "list.txt" to your HostileSubBruteForcer domain and replace it with the existing file.
    
Documentation for the script can be found here: [@Nahamsec/HostileSubBruteForcer](https://github.com/nahamsec/HostileSubBruteforcer)
