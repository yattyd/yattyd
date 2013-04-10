#! /bin/sh

if [ -e index.html ]; then 
	rm index.html
fi

#DIRS=`ls --format=single-column`
ls --format=single-column > /tmp/a.txt

cat << __EOF__ > index.html
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
   <meta http-equiv=\"Content-Type\" content=\"text/html; CHARSET=gb2312\">
   <meta name="Author" content="Wei">
   	<TITLE></TITLE>
	<style type="text/css">
         	table{border-collapse:collapse} td{ border:1px solid #999999}
		body {background-color:#888888;}
        </style>  

</head>

<!-- BODY LANG=en-CA\" DIR=\"LTR\" -->
<body text="#000000" bgcolor="#FFFFFF" link="#0000EE" vlink="#551A8B" alink="#FF0000" background="/GIF/BACKGRD/AAAT2001.GIF">
<left>
<hr WIDTH="100%"><a href="/index.html" TARGET="_top">Home</a>
<br>
<hr WIDTH="100%"><br>

__EOF__

##########################################################################
# ??3???????????, ??????????????? 

#cat /tmp/a.txt | while read line
#sed -n p /tmp/a.txt | while read line
grep ^ /tmp/a.txt | while read line; do 
	i=$line
	if [ -d $i ]; then
		if [[ $i != *_files ]] ; then
			echo "<A HREF=\"./${i}\" TARGET=\"_top\">${i}</A><br/>" >> index.html
		fi 
	elif [ "$i" != "index.html" ] && [ "$i" != "MAIN.HTM" ] && [ "$i" != "menu.html" ]; then
		if [[ $i != dir-to-html*.sh ]]; then
			echo "<A HREF=\"./${i}\" TARGET=\"_top\">${i}</A><br/>" >> index.html
		fi
	fi
done

#while read line
#do
#	echo $line
#done < "input_file"
#??????
#?????subshell


#for i in $DIRS ; do
#	echo "<P STYLE=\"margin-bottom: 0cm\"><A HREF=\"./${i}/\">${i}</A></P>" >> menu.html
#done


echo "</body>" >> index.html
echo "</html>" >> index.html
