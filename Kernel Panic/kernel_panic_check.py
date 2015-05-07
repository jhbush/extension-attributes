#!/usr/bin/python
from datetime import datetime
import os

panic_files = os.popen("echo $(ls /Library/Log/DiagnosticReport/*.panic)").read().split()
panic_dates = []
time_format = "%Y-%m-%d"
date_differences = []
sum = 0.0

if  panic_files == []:
    print "<result>No Panics</result>"
elif len(panic_files) == 1:
    print "<result>One Panic</result>"
else:
    for file in panic_files:
        panic_dates.append(str(file.split('_')[1].split('-')[0])+ '-' +
                           str(file.split('_')[1].split('-')[1])+ '-' +
                           str(file.split('_')[1].split('-')[2]))

    for panic_date in panic_dates:
        position = panic_dates.index(panic_date) + 1
        if panic_dates.index(panic_date) < (len(panic_dates) - 1):
            if (datetime.strptime(panic_dates[position], time_format) - datetime.strptime(panic_date, time_format)).days >= 60:
                pass
            else:
                date_differences.append((datetime.strptime(panic_dates[position], time_format) - datetime.strptime(panic_date, time_format)).days)
    date_differences.append((datetime.now() - datetime.strptime(panic_dates[-1], time_format)).days)

    for date_difference in date_differences:
        sum = sum + date_difference

    panic_average = int(round(sum / len(date_differences),0))

    if panic_average > 30:
        print "<result>Occasional Panics\nEvery " + str(panic_average) + " days</result>"
    elif panic_average > 13:
        print "<result>Regular Panics\nEvery " + str(panic_average) + " days</result>"
    else:
        print "<result>Frequent Panics\nEvery " + str(panic_average) + " days</result>"