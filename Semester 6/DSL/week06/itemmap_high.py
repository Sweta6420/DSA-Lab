import fileinput
for line in fileinput.input():
	data = line.strip().split(",")
	if len(data) == 8:
		SNo,ObservationDate,ProvinceState,CountryRegion,LastUpdate,Confirmed,Deaths,Recovered= data
		print ("{0}\t{1}".format(CountryRegion, Confirmed))