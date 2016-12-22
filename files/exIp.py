from bs4 import BeautifulSoup
import urllib2
import re

url='http://ipleak.com/ip-address-lookup/'
req=urllib2.Request(url, headers={'User-Agent':'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36'})
webpage=urllib2.urlopen(req)
content=webpage.read()
# print content
soup = BeautifulSoup(content, "html.parser")
ip = soup.find(id="ip-info").h1
ip = re.findall( r'[0-9]+(?:\.[0-9]+){3}', str(ip))
country = soup.find(id="showCountryInfo")['data-country']

print str(country), str(ip)
