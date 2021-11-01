# Python code to illustrate Sending mail with attachments
# from your Gmail account

# libraries to be imported
import smtplib
import glob
import os
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
from os import listdir
from os.path import isfile, join

#Hotmail account, for gmail change the smtp server.
fromaddr = "shenzyn2021@outlook.com"

#provide the name in below list use comma for multiple email addresses
toaddr = ["sarav.s@shenzyn.com,saravjeet3@gmail.com,saravjeet.singh@hotmail.com"]

for email in toaddr:
    # instance of MIMEMultipart
    msg = MIMEMultipart()

    # storing the senders email address
    msg['From'] = fromaddr

    # storing the receivers email address
    msg['To'] = email

    # storing the subject
    msg['Subject'] = "Shenzyn Automation Test Results"

    html = """\
    <html>
      <body>
        <p>Hello,<br>Please find the attached zipped Test Results for Jobseeker, Hiring Partner and Employer.
           <br>Please extract the contents and view the reports.
           <br>Regards,
           <br>Shenzyn Testing Team
           <a href="http://www.shenzyn.com">Shenzyn</a> 
        </p>
      </body>
    </html>
    """
    path = r"C:/gitclonenew/Shenzyn-Test-Aut/development/shenzyn/ZippedResults/report-20210902-160501.html"
    report = open(path, "r", encoding='utf-8')

    # string to store the body of the mail
    body = "Hello, \nPlease find the attached zipped Test Results for Jobseeker, Hiring Partner and Employer." \
           "\n\nPlease extract the contents and view the reports." \
           "\n\n\n\nRegards,\nShenzyn Testing Team"

    # attach the body with the msg instance
    #msg.attach(MIMEText(body, 'plain'))
    msg.attach(MIMEText(html, 'html'))

    # Get the latest file from the Results Directory
    mypath = r'C:\gitclonenew\Shenzyn-Test-Aut\development\shenzyn\ZippedResults'
    onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]

    full_path_list = []
    for x in onlyfiles:
        full_path_list.append(mypath + "\\" + x)

    for x,y in zip(full_path_list,onlyfiles):
        # open the file to be sent
        attachment = open(x, "rb")

        # instance of MIMEBase and named as p
        p = MIMEBase('application', 'octet-stream')

        # To change the payload into encoded form
        p.set_payload(attachment.read())

        # encode into base64
        encoders.encode_base64(p)

        p.add_header('Content-Disposition',"attachment; filename = %s" % y)

        # attach the instance 'p' to instance 'msg'
        msg.attach(p)

    # creates SMTP session
    s = smtplib.SMTP('smtp-mail.outlook.com', 587)

    # start TLS for security
    s.starttls()

    # Authentication
    s.login(fromaddr, "s33rat@123")

    # Converts the Multipart msg into a string
    text = msg.as_string()

    # sending the mail
    s.sendmail(fromaddr, email, text)

    # terminating the session
    s.quit()
