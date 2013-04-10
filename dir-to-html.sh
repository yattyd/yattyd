#! /bin/sh

if [ -e menu.html ]; then 
	rm menu.html
fi

###############################################################################
###############################################################################
cat << __INDEX_EOF__ > index.html
<HTML>
<HEAD>
   <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=gb2312">
   <META NAME="Author" CONTENT="Wei">

   <TITLE></TITLE>
</HEAD>
  <FRAMESET COLS="25%,75%">
   <NOFRAMES> 很抱歉，请使用支持 FrameSet Tag 的WWW浏览器 </NOFRAMES>
   <FRAME SRC="menu.html" NAME="MENU">
   <FRAME SRC="MAIN.HTM" NAME="MAIN_VIEW">
  </FRAMESET>
</HTML>
__INDEX_EOF__

###############################################################################
###############################################################################
cat << __MAIN_EOF__ > MAIN.HTM
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; CHARSET=gb2312">
   <title></title>
   <style type="text/css">
	body {color:#FFFFFF; background-color:#000000;}
   </style>  
</head>
<body>
</body>
</html>
__MAIN_EOF__

###############################################################################
###############################################################################
#DIRS=`ls --format=single-column`
ls --format=single-column > /tmp/a.txt

cat << __EOF__ > menu.html
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
   <meta http-equiv=\"Content-Type\" content=\"text/html; CHARSET=gb2312\">
   <meta name="Author" content="Wei">
   	<TITLE></TITLE>
	<style type="text/css">
         	table{border-collapse:collapse} td{ border:1px solid #999999}
		body { background-color:#888888;}
        </style>  

</head>

<body text="#000000" bgcolor="#FFFFFF" link="#0000EE" vlink="#551A8B" alink="#FF0000" background="/GIF/BACKGRD/AAAT2001.GIF">
<left>
<a href="/index.html" TARGET="_top">Home</a>
&nbsp;&nbsp;
<a href="../index.html" TARGET="_top">Back</a>
<br>
<!--
<hr WIDTH="100%"><br>
-->
<div align="left"><b><font size="2"> 
  <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td> 
__EOF__

##########################################################################

#cat /tmp/a.txt | while read line
#sed -n p /tmp/a.txt | while read line
grep ^ /tmp/a.txt | while read line; do 
	i=$line
	if [ -d "$i" ]; then
	if [[ $i != *_files ]]; then
          	echo "<a href=\"./${i}\" target="_top">${i}</A><br/>" >> menu.html
	fi
	elif [ "$i" != "index.html" ] && [ "$i" != "MAIN.HTM" ] && [ "$i" != "menu.html" ]; then
		echo "<a href=\"./${i}\" TARGET=\"MAIN_VIEW\">${i}</A><br/>" >> menu.html
	fi
done


echo "      </td>" >> menu.html
echo "    </tr>" >> menu.html
echo "  </table>" >> menu.html
echo "</body>" >> menu.html
echo "</html>" >> menu.html
###############################################################################
###############################################################################
