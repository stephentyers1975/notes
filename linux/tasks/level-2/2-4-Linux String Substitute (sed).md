# Linux String Substitute (sed)
There is some data on Nautilus App Server 3 in Stratos DC. Data needs to be altered in several of the files. On Nautilus App Server 3, alter the /home/BSD.txt file as per details given below:

a. Delete all lines containing word following and save results in /home/BSD_DELETE.txt file. (Please be aware of case sensitivity)

b. Replace all occurrence of word and to for and save results in /home/BSD_REPLACE.txt file.

`sed 's/\bfollowing\b//g' /home/BSD.txt > /home/BSD_DELETE.txt`
`sed 's/\band\b/for/g' /home/BSD.txt > /home/BSD_REPLACE.txt`