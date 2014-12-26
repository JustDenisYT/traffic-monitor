little script to monitor the traffic of your unix server.
Just place the script on your server and put it into a daily cronjob.

To have the script working you will have to install the following libs:

**aptitude install vnstati sharutils mailutils imagemagick**

Then you only need to change the **MAILTO** and **INTERFACES**.
Done. You will now receive a mail with you traffic report every time 
your cron is running.
