#!/usr/bin/python
import os.path, subprocess, datetime, dateutil.parser, time, sys

def apple_year_offset(dateobj, years=0):
	# Convert to a maleable format
	mod_time = dateobj.timetuple()
	# Offset year by number of years
	mod_time = time.struct_time(tuple([mod_time[0]+years]) + mod_time[1:])
	# Convert back to a datetime obj
	return datetime.datetime.fromtimestamp(int(time.mktime(mod_time)))

def estimated_warranty_date_from_serial(serial):
	# http://www.macrumors.com/2010/04/16/apple-tweaks-serial-number-format-with-new-macbook-pro/
	est_date = u''
	if 10 < len(serial) < 13:
		if len(serial) == 11:
			# Old format
			year = serial[2].lower()
			est_year = 2000 + '   3456789012'.index(year)
			week = int(serial[3:5]) - 1
			year_time = datetime.date(year=est_year, month=1, day=1)
			if (week):
				week_dif = datetime.timedelta(weeks=week)
				year_time += week_dif
		else:
			# New format
			alpha_year = 'cdfghjklmnpqrstvwxyz'
			year = serial[3].lower()
			est_year = 2010 + (alpha_year.index(year) / 2)
			# 1st or 2nd half of the year
			est_half = alpha_year.index(year) % 2
			week = serial[4].lower()
			alpha_week = ' 123456789cdfghjklmnpqrtvwxy'
			est_week = alpha_week.index(week) + (est_half * 26) - 1
			year_time = datetime.date(year=est_year, month=1, day=1)
			if (est_week):
				week_dif = datetime.timedelta(weeks=est_week)
				year_time += week_dif
	return apple_year_offset(year_time, 3).strftime('%Y-%m-%d')

def warranty_is_expired(date_string):
	ExpirationDate=dateutil.parser.parse(date_string).date()
	TodaysDate=datetime.date.today()
	return TodaysDate > ExpirationDate

def main():
	if os.path.exists('/Library/Preferences/com.apple.warranty.plist'):
		# get plist data
		WarrantyDate=subprocess.check_output(['/usr/bin/defaults', 'read', '/Library/Preferences/com.apple.warranty', 'WarrantyDate']).rstrip()
		WarrantyStatus=subprocess.check_output(['/usr/bin/defaults', 'read', '/Library/Preferences/com.apple.warranty', 'WarrantyStatus']).rstrip()
		
		# if warranty is listed as active but date is expired, update plist entry
		if (WarrantyStatus == "Active") and (warranty_is_expired(WarrantyDate)): 
			WarrantyStatus="Inactive"
			result_code = subprocess.call(['/usr/bin/defaults', 'write', '/Library/Preferences/com.apple.warranty', 'WarrantyStatus', WarrantyStatus])
			print "Status updated."
		else:
			print "Status unchanged."
		print "<result>%s : %s</result>" % (WarrantyStatus, WarrantyDate)
		sys.exit(0)

	# get serial number
	SerialNumber=subprocess.check_output('ioreg -l | awk \'/IOPlatformSerialNumber/ { split($0, line, "\\""); printf("%s\\n", line[4]); }\'', shell=True).rstrip()
	if not SerialNumber:
		print "Serial Number not found."
		sys.exit(1)

	# Now we use the code above
	WarrantyDate = estimated_warranty_date_from_serial(SerialNumber)
	if warranty_is_expired(WarrantyDate):
		WarrantyStatus = "Expired"
	else:
		WarrantyStatus = "Active"

	result_code = subprocess.call(['/usr/bin/defaults', 'write', '/Library/Preferences/com.apple.warranty', 'WarrantyStatus', WarrantyStatus])
	result_code = subprocess.call(['/usr/bin/defaults', 'write', '/Library/Preferences/com.apple.warranty', 'WarrantyDate', WarrantyDate])

	print "Serial Number:", SerialNumber
	print "Warranty Status:", WarrantyStatus
	print "Warranty Expiration:", WarrantyDate
	print "<result>%s : %s</result>" % (WarrantyStatus, WarrantyDate)

if __name__ == "__main__":
	main()