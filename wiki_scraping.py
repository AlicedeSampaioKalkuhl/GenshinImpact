import pandas as pd 
from urllib.request import urlopen
from io import StringIO
from bs4 import BeautifulSoup

char_html = urlopen("https://genshin-impact.fandom.com/wiki/Character/List").read().decode("utf-8")
char_html_filtered = char_html[char_html.find('<table class="article-table sortable alternating-colors-table">'):char_html.find('</table>')]
all_characters = pd.read_html(StringIO(char_html_filtered))

norm_boss_html = urlopen("https://genshin-impact.fandom.com/wiki/Normal_Boss").read().decode("utf-8")
normal_bosses = pd.read_html(StringIO(norm_boss_html), header=0) # needs to be cleaned up

domain_mastery_html = urlopen("https://genshin-impact.fandom.com/wiki/Domain_of_Mastery").read().decode("utf-8")
domain_mastery = pd.read_html(StringIO(domain_mastery_html), header=0) # needs to be cleaned up 

weekly_boss_html = urlopen("https://genshin-impact.fandom.com/wiki/Trounce_Domain").read().decode("utf-8")
weekly_boss = pd.read_html(StringIO(weekly_boss_html), header = 0)
print(weekly_boss)

domain_forgery_html = urlopen("https://genshin-impact.fandom.com/wiki/Domain_of_Forgery").read().decode("utf-8")
domain_forgery = pd.read_html(StringIO(domain_forgery_html), header = 0)

local_html = urlopen("https://genshin-impact.fandom.com/wiki/Local_Specialty").read().decode("utf-8")
local = pd.read_html(StringIO(local_html), header = 0)


enhancement_html = urlopen("https://genshin-impact.fandom.com/wiki/Character_and_Weapon_Enhancement_Material").read().decode("utf-8")
enhancement = pd.read_html(StringIO(enhancement_html))

talents_html = urlopen("https://genshin-impact.fandom.com/wiki/Character_Talent_Material").read().decode("utf-8")
talents = pd.read_html(StringIO(talents_html), header = 0)

weapons_html = urlopen("https://genshin-impact.fandom.com/wiki/Weapon_Ascension_Material").read().decode("utf-8")
weapons = pd.read_html(StringIO(weapons_html), header = 0)

#for i in 1:all_characters.character(): 
#    url = urlopen(["https://genshin-impact.fandom.com/wiki/" + character[i] + "#Ascensions_and_Stats"]).read().decode("utf-8")
#materials = 