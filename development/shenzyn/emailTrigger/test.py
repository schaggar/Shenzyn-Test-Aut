import re

with open("C:/gitclonenew/Shenzyn-Test-Aut/development/shenzyn/ZippedResults/cron.2021-09-18.txt") as f:
    lines = f.readlines()

# for l in lines:
#     print(l)

#x = re.findall('[TC\d+\:\s]\w+', str(lines))
x = re.findall('^TC.+\:', str(lines))

print(x)