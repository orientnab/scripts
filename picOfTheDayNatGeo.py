from bs4 import BeautifulSoup
import requests

natgeo_landing_url = "https://www.nationalgeographic.com/photography/photo-of-the-day/"
natgeo_landing_web = requests.get(natgeo_landing_url)
natgeo_landing_soup = BeautifulSoup(natgeo_landing_web.text, 'html.parser')
natgeo_potd_url = natgeo_landing_soup.find("meta", attrs={"property": "og:url"})['content']
natgeo_potd_web = requests.get(natgeo_potd_url)
natgeo_potd_soup = BeautifulSoup(natgeo_potd_web.text, 'html.parser')
potd_url = natgeo_potd_soup.find('meta', attrs={"property": "og:image"})['content']

print(potd_url)

