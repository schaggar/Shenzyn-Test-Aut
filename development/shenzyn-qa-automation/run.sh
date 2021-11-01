cd /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/development/shenzyn-qa-automation/
robot --timestampoutputs -d Results Tests/Stage

cd /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/development/shenzyn-qa-automation/Results
rm -rf geckodriver*
rm -rf *.png

#Code to save the latest results into separate folder which will be used to send email
cd Results/
ls -lrt|tail -4 >> list1
cut -d ' ' -f 9 list1 >> list2
sed -i '/^$/d' list2
cat list2|while read line; do cp "$line" ../zipfiles/;done
rm list*
cd ../zipfiles/
#zip Automation_Results.zip *

echo "Copying the cron log....."
mv /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/development/shenzyn-qa-automation/runs/cron.txt /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/development/shenzyn-qa-automation/runs/cron.`date +"%Y-%m-%d"`.txt
cp /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/development/shenzyn-qa-automation/runs/cron.`date +"%Y-%m-%d"`.txt /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/development/shenzyn-qa-automation/zipfiles/cron.`date +"%Y-%m-%d"`.txt

#This will shoot email
python /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/development/shenzyn-qa-automation/consolidated_email.py

echo "Removing the file which has been sent over email......"
rm *.xml
rm *.html
#rm Automation_Results.zip
rm /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/development/shenzyn-qa-automation/zipfiles/cron.`date +"%Y-%m-%d"`.txt
