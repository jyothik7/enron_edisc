# Enron EDiscovery

## Requirements
Needs perl HTML::Entities lib
```shell
sudo perl -MCPAN -e 'shell'
cpan[1]>  install HTML::Parser 
```

## Scripts
### lib/enronScript.sh
Shell script, requires hard coded directory locations
### lib/parseToTags.pl
Perl script that parses emails and attachments into tags
