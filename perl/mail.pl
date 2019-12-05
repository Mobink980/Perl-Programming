#!/usr/bin/perl -w
# ############################ send_mail_text.pl #################
# Date    : Dec 31 2010
# Purpose : Perl example script for sending out text e-mails
# Author  : Frank Migge (support at frank4dd dot com)
# URL     : http://fm4dd.com/programming
# License : GPL - http://www.fsf.org/licenses/gpl.txt
# Version : 1.0 initial release
# #################################################################
# use Mail::Sendmail;
use strict;
use warnings;

# #################################################################
# define the e-mail participants, server and content
# #################################################################
# create the main e-mail hash structure [REQUIRED]
my %mail;
# set the smtp mail server [REQUIRED]
$mail{smtp}    = "127.0.0.1";
# set the recipients (to) address [REQUIRED]
$mail{To}      = "Test Receiver ";
# set the mail sender address [REQUIRED]
$mail{From}    = "Test Sender ";
$mail{Sender}  = "Test Sender ";
# set the carbon copy (cc) recipient address
# $mail{Cc}      = undef;
# set the blind carbon copy (bcc) recipient address
# $mail{Bcc}     = undef;
# set the  mail subject line
$mail{subject} = "Test message";
# set the mail content
$mail{body}    = "The test messsage is having this body line inside.";
# set the mail encoding type
$mail{'content-type'} = qq(text/plain; charset="utf-8");

# #################################################################
# send the e-mail out and return verbose information
# #################################################################
sendmail(%mail) or die $Mail::Sendmail::error;
print "The sendmail log reports:\n".$Mail::Sendmail::log."\n";
exit 0;