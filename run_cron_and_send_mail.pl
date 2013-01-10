#!/usr/bin/perl -w
use strict;
use Net::SMTP;

my $log_dir = "/opt/scorecard/log";
my $job_to_run = shift || & USAGE();

my ($sec, $min, $hr, $day, $mon, $year) = localtime;

my $timestamp = sprintf("%02d_%02d_%04d_%02d_%02d_%02d\n", $day, $mon + 1, 1900 + $year, $hr, $min, $sec);

my $log_file = "est_cuisine_runner.$timestamp";

print "Running $job_to_run > $log_dir/$log_file\n" ;

my $return_val = `$job_to_run > $log_dir/$log_file` ;
file to send emails


## =========
my $smtp = Net::SMTP->new("cmailer.indiatimes.com"
			, Debug => 1  );
 
$smtp->mail("pradeep.sethi\@indiatimes.co.in");
File Edit Options Buffers Tools Help                                                                                                               
## =========                                                                                                                                       
my $smtp = Net::SMTP->new("cmailer.indiatimes.com"
                        , Debug => 1  );

$smtp->mail("pradeep.sethi\@indiatimes.co.in");
$smtp->to("pradeep.sethi\@indiatimes.co.in");


$smtp->data();
$smtp->datasend("Subject: CRON Output [$job_to_run] : $timestamp\r\n");
$smtp->datasend("\n");

open(LOGFILE, "<$log_dir/$log_file") || die "Could not open log file : $!";
while (<LOGFILE>) {
        $smtp->datasend($_);
}

$smtp->dataend();

$smtp->quit;

close LOGFILE;





sub USAGE {
    die "USAGE:\nrun_cron_and_mail.pl [Job to Run] [Args]\nSample:\nperl run_cron_and_mail.pl \"php test_cron.php \"\n";

}

