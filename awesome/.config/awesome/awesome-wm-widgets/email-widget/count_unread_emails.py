#!/usr/bin/python

import imaplib
import re

M=imaplib.IMAP4_SSL("mail.teenagemutantninjaturtles.com", 993)
M.login("azizul7m@gmail.com","29498547")

status, counts = M.status("INBOX","(MESSAGES UNSEEN)")

if status == "OK":
	unread = re.search(r'UNSEEN\s(\d+)', counts[0].decode('utf-8')).group(1)
else:
	unread = "N/A"

print(unread)
