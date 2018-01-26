import json
data = json.load(open('mapcity1.json'))
data2 = json.load(open('mapcity2.json'))

# TIm ten city tu code city
for c in data:
	if c['code'] == 'HN':
		break

# TIm ten district tu code district
for c in data:
	if c['code'] == 'SG':
		d = c['district']
		for x in d:
			if x['id'] == 72:
				
				break

# TIm ten ward tu code ward
for c in data:
	if c['code'] == 'HN':
		d = c['district']
		for x in d:
			if x['id'] == 2:
				w = x['ward']
				s = x['street']
				for wx in w:
					if wx['id'] == 67:
						print 'Quan ' + wx['name']
						break

				for sx in s:
					if sx['id'] == 800:
						print 'Duong ' + sx['name']
						break